# コマンド系
function c { clear }
function q { exit }
function open { start . }
function rmrf { if ($args.length -eq 0) { return } rm -r -fo $args[0] }
