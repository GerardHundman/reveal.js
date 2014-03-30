#! /bin/bash
# generated by collect_git_add_recursively.sh

pushd $(dirname $0)                                                                                     2> /dev/null   > /dev/null
cd ..


mode="R"

Win7DEV_BASEDIR=/media/sf_D_DRIVE/h/prj/1original/visyond/visyond

function git_submod_add {
    git submodule  add $1 $2
    if test "$mode" = "W" ; then
        git_register_remote_for_UnixVM $1 $2
    fi
}

function git_register_remote_for_UnixVM {
    if test -d "$2" ; then
        if test -d "$Win7DEV_BASEDIR/$2" ; then
            pushd $2                                                                                    2> /dev/null  > /dev/null
            git remote remove Win7DEV
            git remote add Win7DEV $Win7DEV_BASEDIR/$2
            popd                                                                                        2> /dev/null  > /dev/null
        fi
    fi
}

getopts ":Wh" opt
#echo opt+arg = "$opt$OPTARG"
case "$opt$OPTARG" in
W )
  echo "--- registering Win7DEV as remote ---"
  mode="W"
  for (( i=OPTIND; i > 1; i-- )) do
    shift
  done
  #echo args: $@
  if test -d "$1" ; then
    Win7DEV_BASEDIR=$1
  fi
  #
  # register Win7DEV remote for main repo as well!
  if test -d "$Win7DEV_BASEDIR" ; then
    git remote remove Win7DEV
    git remote add Win7DEV $Win7DEV_BASEDIR
  fi
  ;;

"?" )
  echo "--- registering git submodules ---"
  mode="R"
  ;;

* )
  cat <<EOT
$0 [-W <optional_remote_path>]

set up git submodules / submodule references for all submodules.

-W       : set up 'Win7DEV' remote reference per submodule

           When you don't specify the remote path yourself,
           the default is set to:
             "$Win7DEV_BASEDIR"

EOT
  exit
  ;;
esac




git_submod_add   git@github.com:GerHobbelt/LocalConnection.js.git                        lib/LocalConnection
git_submod_add   git@github.com:GerHobbelt/SyntaxHighlighter.git                         lib/plugins/SyntaxHighlighter
git_submod_add   git@github.com:GerHobbelt/classList.js.git                              lib/js/classList
git_submod_add   git@github.com:GerHobbelt/headjs.git                                    lib/js/head
git_submod_add   git@github.com:GerHobbelt/highlight.js.git                              lib/plugins/highlight
git_submod_add   git@github.com:GerHobbelt/marked.git                                    lib/plugins/marked
git_submod_add   git@github.com:GerHobbelt/nprogress.git                                 lib/js/nprogress
git_submod_add   git@github.com:GerHobbelt/require-css.git                               lib/js/requireCSS
git_submod_add   git@github.com:GerHobbelt/require-less.git                              lib/js/require-less
git_submod_add   git@github.com:GerHobbelt/requireJS-domReady.git                        lib/js/require-domReady
git_submod_add   git@github.com:GerHobbelt/requirejs-plugins.git                         lib/js/require-plugins
git_submod_add   git@github.com:GerHobbelt/requirejs.git                                 lib/js/requireJS
git_submod_add   git@github.com:GerHobbelt/response.js.git                               lib/js/response.js
git_submod_add   git@github.com:GerHobbelt/scopedQuerySelectorShim.git                   lib/scopedQuerySelectorShim
git_submod_add   git@github.com:GerHobbelt/text.git                                      lib/js/require-text
git_submod_add   git@github.com:GerHobbelt/verge.git                                     lib/js/verge
git_submod_add   git@github.com:GerHobbelt/whitespace-cleaner.git                        util/wsclean
git_submod_add   git@github.com:GerHobbelt/zoom.js.git                                   lib/plugins/zoom



popd                                                                                                    2> /dev/null   > /dev/null

