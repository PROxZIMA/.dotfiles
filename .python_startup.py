from rich.console import Console
from rich.theme import Theme
from rich.traceback import install

console = Console(
    theme=Theme({"traceback.border": "#161925", "traceback.border.syntax_error": "#161925"}),
)

install(extra_lines=0, word_wrap=True, show_locals=True, theme="inkpot")
