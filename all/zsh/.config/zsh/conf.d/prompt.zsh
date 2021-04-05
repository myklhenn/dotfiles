function _pp() {
    # $1: prompt piece text, $2: prompt piece color
    # NOTE: prints to stdout, so make sure to use command substitution!
    printf '%%F{%s}%s%%f' $2 $1
}
local P_NORMAL="$(_pp '%n' 'blue')@$(_pp '%m' 'magenta') $(_pp '%~' 'green')"
local P_ERROR="$(_pp '%n@%m %~' 'red')"
PROMPT=$(printf '%%(?.%s.%s) %%# ' $P_NORMAL $P_ERROR)