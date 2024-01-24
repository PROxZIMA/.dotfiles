#!/usr/bin/env python3

import os
import subprocess
from datetime import datetime
from pathlib import Path

import gi
import requests

gi.require_version("Gtk", "3.0")
gi.require_version("AppIndicator3", "0.1")

from gi.repository import AppIndicator3, GLib, Gtk

APPINDICATOR_ID = "ProxyApplet"

WALLS_PATH = Path("~/.config/hypr/wallpapers/").expanduser()
WALLS_BINARY = 'swww'

CURR_WALL = 0

WEATHER_CODES = {
    "113": "☀️ ",
    "116": "⛅ ",
    "119": "☁️ ",
    "122": "☁️ ",
    "143": "☁️ ",
    "176": "🌧️",
    "179": "🌧️",
    "182": "🌧️",
    "185": "🌧️",
    "200": "⛈️ ",
    "227": "🌨️",
    "230": "🌨️",
    "248": "☁️ ",
    "260": "☁️ ",
    "263": "🌧️",
    "266": "🌧️",
    "281": "🌧️",
    "284": "🌧️",
    "293": "🌧️",
    "296": "🌧️",
    "299": "🌧️",
    "302": "🌧️",
    "305": "🌧️",
    "308": "🌧️",
    "311": "🌧️",
    "314": "🌧️",
    "317": "🌧️",
    "320": "🌨️",
    "323": "🌨️",
    "326": "🌨️",
    "329": "❄️ ",
    "332": "❄️ ",
    "335": "❄️ ",
    "338": "❄️ ",
    "350": "🌧️",
    "353": "🌧️",
    "356": "🌧️",
    "359": "🌧️",
    "362": "🌧️",
    "365": "🌧️",
    "368": "🌧️",
    "371": "❄️",
    "374": "🌨️",
    "377": "🌨️",
    "386": "🌨️",
    "389": "🌨️",
    "392": "🌧️",
    "395": "❄️ ",
}


def format_time(time):
    return time.replace("00", "").zfill(2)


def format_temp(temp):
    return (temp + "°").ljust(3)


def format_chances(hour):
    chances = {
        "chanceoffog": "Fog",
        "chanceoffrost": "Frost",
        "chanceofovercast": "Overcast",
        "chanceofrain": "Rain",
        "chanceofsnow": "Snow",
        "chanceofsunshine": "Sunshine",
        "chanceofthunder": "Thunder",
        "chanceofwindy": "Wind",
    }

    conditions = []
    for event in chances:
        if int(hour[event]) > 0:
            conditions.append(chances[event] + " " + hour[event] + "%")
    return ", ".join(conditions)


def get_weather_data():
    data = {}

    try:
        weather = requests.get("https://wttr.in/411001?format=j1", timeout=20).json()
    except Exception:
        # Display error message if unable to retrieve weather information
        data["icon"] = "🪐"
        data["text"] = " N/A"
        data["dialog"] = "Weather data unavailable"
        return data

    tempint = int(weather["current_condition"][0]["FeelsLikeC"])
    extrachar = ""
    if tempint > 0 and tempint < 10:
        extrachar = "+"

    data["icon"] = WEATHER_CODES[weather["current_condition"][0]["weatherCode"]]
    data["text"] = (
        weather["current_condition"][0]["weatherDesc"][0]["value"]
        + " "
        + extrachar
        + weather["current_condition"][0]["FeelsLikeC"]
        + "°"
    )

    data[
        "dialog"
    ] = f"{weather['nearest_area'][0]['areaName'][0]['value']}, {weather['nearest_area'][0]['country'][0]['value']}\n"
    data[
        "dialog"
    ] += f"{weather['current_condition'][0]['weatherDesc'][0]['value']} {weather['current_condition'][0]['temp_C']}°\n"
    data["dialog"] += f"Feels like: {weather['current_condition'][0]['FeelsLikeC']}°\n"
    data["dialog"] += f"Wind: {weather['current_condition'][0]['windspeedKmph']}Km/h\n"
    data["dialog"] += f"Humidity: {weather['current_condition'][0]['humidity']}%\n"
    for i, day in enumerate(weather["weather"]):
        data["dialog"] += "\n"
        if i == 0:
            data["dialog"] += "Today, "
        if i == 1:
            data["dialog"] += "Tomorrow, "
        data["dialog"] += f"{day['date']}\n"
        data["dialog"] += f"⬆️ {day['maxtempC']}° ⬇️ {day['mintempC']}° "
        data["dialog"] += f"🌅 {day['astronomy'][0]['sunrise']} 🌇 {day['astronomy'][0]['sunset']}\n"
        for hour in day["hourly"]:
            if i == 0 and int(format_time(hour["time"])) < datetime.now().hour - 2:
                continue
            data[
                "dialog"
            ] += f"{format_time(hour['time'])} {WEATHER_CODES[hour['weatherCode']]} {format_temp(hour['FeelsLikeC'])} {hour['weatherDesc'][0]['value']}, {format_chances(hour)}\n"

    return data


def update_weather_item_label(weather_item):
    data = get_weather_data()
    weather_item.set_label(data["icon"] + data["text"])
    return True

def update_weather_dialog(dialog):
    data = get_weather_data()
    dialog.format_secondary_text(data["dialog"])
    # return False to end periodic call
    return False

def weather_callback(menu_item):
    # Create dialog box to display weather information
    dialog = Gtk.MessageDialog(
        parent=Gtk.Window(), flags=0, message_type=Gtk.MessageType.INFO, buttons=Gtk.ButtonsType.OK, text="Current Weather"
    )
    dialog.format_secondary_text("Loading weather information...")
    GLib.timeout_add(500, update_weather_dialog, dialog)
    dialog.run()
    dialog.destroy()


def change_wallpaper(widget, next=None):
    global CURR_WALL
    walls = list(WALLS_PATH.glob("**/*"))
    CURR_WALL += next
    if len(walls) <= CURR_WALL:
        CURR_WALL = 0
    subprocess.call([WALLS_BINARY, str(walls[CURR_WALL])])


def clipboard_callback(widget, type=None):
    if type == "activate":
        os.system(
            "pkill tofi || cliphist list | tofi -c ~/.config/tofi/tofi.clip.conf | cliphist decode | wl-copy"
        )
    elif type == "delete":
        os.system("pkill tofi || cliphist list | tofi -c ~/.config/tofi/tofi.clip.conf | cliphist delete")
    elif type == "nuke":
        os.system("rm -f ~/.cache/cliphist/db")


def _quit(_):
    Gtk.main_quit()


def build_menu():
    menu = Gtk.Menu()

    # Weather menu item
    weather_item = Gtk.MenuItem(label="🪐 Display Weather")
    weather_item.connect("activate", weather_callback)
    menu.append(weather_item)

    # create a wallmenu
    wallmenu = Gtk.Menu()
    wallmenu_next = Gtk.MenuItem(label="Next")
    wallmenu_next.connect("activate", change_wallpaper, 1)
    wallmenu.append(wallmenu_next)
    wallmenu_prev = Gtk.MenuItem(label="Prev")
    wallmenu_prev.connect("activate", change_wallpaper, -1)
    wallmenu.append(wallmenu_prev)

    # Wallpaper menu item
    wallpaper_item = Gtk.MenuItem(label="Change Wallpaper")
    wallpaper_item.set_submenu(wallmenu)
    menu.append(wallpaper_item)

    # create a clipmenu
    clipmenu = Gtk.Menu()
    clipmenu_activate = Gtk.MenuItem(label="Activate")
    clipmenu_activate.connect("activate", clipboard_callback, "activate")
    clipmenu.append(clipmenu_activate)
    clipmenu_delete = Gtk.MenuItem(label="Delete a clip")
    clipmenu_delete.connect("activate", clipboard_callback, "delete")
    clipmenu.append(clipmenu_delete)
    clipmenu_nuke = Gtk.MenuItem(label="Nuke history")
    clipmenu_nuke.connect("activate", clipboard_callback, "nuke")
    clipmenu.append(clipmenu_nuke)

    # Clipboard menu item
    clipboard_item = Gtk.MenuItem(label="Clipboard")
    clipboard_item.set_submenu(clipmenu)
    # clipboard_item.connect("activate", clipboard_callback, "activate")
    menu.append(clipboard_item)

    # Separator
    menu.append(Gtk.SeparatorMenuItem())

    # Quit menu item
    quit_item = Gtk.MenuItem(label="Quit")
    quit_item.connect("activate", _quit)
    menu.append(quit_item)

    # Start periodic updates for the weather item label every 10min
    update_weather_item_label(weather_item)
    GLib.timeout_add_seconds(600, update_weather_item_label, weather_item)

    menu.show_all()
    return menu


def main():
    indicator = AppIndicator3.Indicator.new(
        APPINDICATOR_ID, "face-devilish-symbolic", AppIndicator3.IndicatorCategory.APPLICATION_STATUS
    )
    indicator.set_status(AppIndicator3.IndicatorStatus.ACTIVE)
    indicator.set_menu(build_menu())
    Gtk.main()


if __name__ == "__main__":
    main()
