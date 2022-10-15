#
# Common functions
#

### Command enhancement functions ###
.1() { cd ../ ; }                                  # Go back 1 directory level
.2() { cd ../../ ; }                               # Go back 2 directory levels
.3() { cd ../../../ ; }                            # Go back 3 directory levels
.4() { cd ../../../../ ; }                         # Go back 4 directory levels
.5() { cd ../../../../../ ; }                      # Go back 5 directory levels
.6() { cd ../../../../../../ ; }                   # Go back 6 directory levels
root() { sudo su - ; }                             # root:         Switch to root user using sudo
f() { open -a Finder ./ ; }                        # f:            Opens current directory in MacOS Finder
path() { echo -e ${PATH//:/\\n} ; }                # path:         Echo all executable Paths
show_options() { shopt ; }                         # Show_options: display bash options settings
weather() { curl wttr.in/$1 ; }                    # CLI Weather
yt() { yt-dlp -S codec:h264:aac -v $1 ; }

j() {
  local bookmarks="$HOME/.bookmarks"

  if [[ ! -f "$bookmarks" ]]; then
    touch "$bookmarks"
  fi

  if [[ "$*" =~ "(-h|--help)" ]]; then
    read -r -d "" usage << EOT
USAGE:
  j [ARGUMENT] [OPTIONS]

ARGUMENT:
  Name of book mark to cd into.

OPTIONS:
  -h, --help          Display usage text.
  -l                  Display all bookmarks.
  -d <bookmark>       Bookmark to delete.
  -c <bookmark>       Bookmark to create.
EOT

    echo "$usage"
    return
  fi

  case $1 in
    "-l")
      cat "$bookmarks"
      ;;

    "-c")
      if [[ -z "$2" ]]; then
        echo "Missing argument for -c" 
        return
      fi
      
      local bookmark="${2}=$(pwd)"
      if [[ -z $(grep "$bookmark" "$bookmarks") ]]; then
        echo $bookmark >> $bookmarks
        echo $bookmark
      else
        echo "Bookmark '$bookmark' already exists."
      fi
      ;;

    "-d")
      local pat="/^$2=.*/d"
      sed -i "" "$pat" "$bookmarks"
      cat "$bookmarks"
      ;;

    "")
      cd $HOME
      ;;

    *)
      val=$1
      local target=$(awk -v key=$val -F"=" '$1 == key {print $2}' "$bookmarks")
      cd "$target" 
      ;;
  esac
}
