from rich.traceback import install
from rich.console import Console
from rich.theme import Theme

console = Console(theme=Theme({
    'traceback.border': '#161725',
    'traceback.border.syntax_error': '#161725'})
)

install(console=console,extra_lines=0,word_wrap=True,show_locals=True)
