import yt_dlp
import Levenshtein

def get_playlist_titles(playlist_url):
    ydl_opts = {
        'quiet': True,
        'extract_flat': True,
        'force_generic_extractor': True,
        'extractor_args': {
            'youtube:playlist': {'force_generic_extractor': True},
        },
    }

    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        result = ydl.extract_info(playlist_url, download=False)
        if 'entries' in result:
            return [entry['title'] for entry in result['entries']]
        else:
            return []

if __name__ == "__main__":
    playlist_url = "https://youtube.com/playlist?list=PLP2ZwojuISKolwMJh-vdVEObEhzoWaCZo"
    titles = get_playlist_titles(playlist_url)

    # if titles:
    #     print("Titles in the playlist:")
    #     for idx, title in enumerate(titles, start=1):
    #         print(f"{idx}. {title}")
    # else:
    #     print("No titles found in the playlist.")

    l = len(titles)
    for i in range(l):
        for j in range(i + 1, l):
            t1, t2 = titles[i], titles[j]
            ratio = Levenshtein.ratio(t1, t2)
            if ratio > 0.6255:
                print(t1, '<->', t2, ratio)
