def main(args):
    pass

def handle_result(args, answer, target_window_id, boss):
    w = boss.window_id_map.get(target_window_id)
    if w is not None:
        if len(args) > 1 and args[1] != 'prev':
            w.scroll_to_mark(prev=False)
        else:
            w.scroll_to_mark()

handle_result.no_ui = True
