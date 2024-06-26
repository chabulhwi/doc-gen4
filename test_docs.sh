# Arguments:
# $1 : path to batteries from working directory
# $2 : path to doc-gen4 from working directory

set -e
set -x

# generate the docs
cd "$1"
sed -i "s|from git \"https://github.com/leanprover/doc-gen4\" @ \"main\"| from \"..\" / \"doc-gen4\"|" lakefile.lean

lake -R -Kdoc=on update
lake -R -Kdoc=on build Batteries:docs
