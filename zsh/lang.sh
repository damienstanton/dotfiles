# configuration aliases
alias vimconf="$EDITOR $HOME/.config/nvim/init.vim"
alias zshconf="$EDITOR $HOME/.zshrc"

# other aliases
alias g="git"
alias cat="bat --theme TwoDark"
alias e="$EDITOR"
alias gs="git status"
alias push="git push"
alias pull="git pull --rebase"
alias c="clear;exa -l -B"
alias ct="clear;exa -T --level=2"
alias ca="clear; ls -la"
alias sub="git submodule update --init --recursive"
alias updateall="brew update && brew upgrade && brew cleanup && npm i -g npm && npm update -g && rustup update"
alias rff="rm -rf"
alias k="kubectl"
alias listening="lsof -P | rg LISTEN"
alias reload="source $HOME/.zshrc"
alias gdiff="git difftool --no-prompt --tool vimdiff"
alias please="sudo"
alias sorry='sudo $(fc -ln -1)'
alias glog= "git log --oneline --decorate --graph"

# activate a Python virtualenv in the current dir
activate() {
	if [ -z "$1" ]; then
		source env/bin/activate
	else
		source $1/bin/activate
	fi
}

# create a new go-mod based Go project
goproject() {
    coord=$1
    project=$2
    mkdir $project && cd $project
    go mod init $coord/$project
cat <<ENDGOFILE > $project.go
package main

import "fmt"

func main() { fmt.Println("$project OK") }
ENDGOFILE
cat <<ENDGOTESTFILE > ${project}_test.go
package main

import "testing"

func TestNothing(t *testing.T) {
    if 1 != 1 { t.Fatal("not possible") }
}
ENDGOTESTFILE
cat <<ENDMAKE > Makefile
.PHONY: default
default:
	build test run

.PHONY: build
build:
	@go build -o bin/$project

.PHONY: test
test:
	@go test -v -cover

.PHONY: _run
_run:
	@go run $project.go

.PHONY: run
run: build _run
ENDMAKE
}

# runner for CMake
cmakebuild() {
    if [ ! -d "build" ]; then
        mkdir build
    fi
    cd build
    cmake -G "Unix Makefiles" ..
    make
    cd ..
}

# human readable size check
sizeof() {
  du -h $1 | tail -n 1
}

# delete all docker images, recursively
dockerdelete() {
	docker rmi --force `docker images -a -q`
}

# synchronize a working branch with another branch via rebase
synchronize() {
	branch=$1
	if [ -z $1 ]; then
    branch=master
  fi
	git checkout $branch 
	git pull --rebase
	git checkout -
	git merge --no-ff $branch
	git push
}

# build a new Java project using maven
javaproject() {
    project=$2
    group=$1
    mvn -B archetype:generate \
        -DarchetypeGroupId=org.apache.maven.archetypes \
        -DgroupId=$group \
        -DartifactId=$project
    echo "Created project $group.$project"
    cd $project
}

# build a new Python project with reasonable defaults
pyproject() {
	mkdir $1 && cd $1
	echo "Building a new project: $1..."
	python3 -m venv env
	source env/bin/activate
	pip3 install pytest pylint mypy python-language-server black pyflakes ipython
	echo "Created project $1 successfully"
}

# retrieve one of my GitHub repos
getme() {
    git clone https://github.com/damienstanton/$1 $2 # where 2 is an alias
}

# retrieve an arbitrary project from GitHub
get() {
	git clone --recursive https://github.com/$1/$2 $@
}

# simpler one-shot commit shortcut
commit() {
    git add -A
    git commit
    git push
}

# firstpush is the same as commit, but sets the origin
firstpush() {
    git add -A
    git commit
    git push --set-upstream origin master
}

# generate a reasonable gitignore
ignore() {
cat <<I>> .gitignore
*.DS_Store
env/
node_modules/
.vscode/
.idea/
target/
build/
.gradle/
**/*.rs.bk
.metals/
.bloop/
.pytest_cache/
.mypy_cache/
I
}

# automatically write an Apache license
copyright() {
cat <<LIC>> LICENSE
Apache License
Version 2.0, January 2004
http://www.apache.org/licenses/

TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

1. Definitions.

"License" shall mean the terms and conditions for use, reproduction,
and distribution as defined by Sections 1 through 9 of this document.

"Licensor" shall mean the copyright owner or entity authorized by
the copyright owner that is granting the License.

"Legal Entity" shall mean the union of the acting entity and all
other entities that control, are controlled by, or are under common
control with that entity. For the purposes of this definition,
"control" means (i) the power, direct or indirect, to cause the
direction or management of such entity, whether by contract or
otherwise, or (ii) ownership of fifty percent (50%) or more of the
outstanding shares, or (iii) beneficial ownership of such entity.

"You" (or "Your") shall mean an individual or Legal Entity
exercising permissions granted by this License.

"Source" form shall mean the preferred form for making modifications,
including but not limited to software source code, documentation
source, and configuration files.

"Object" form shall mean any form resulting from mechanical
transformation or translation of a Source form, including but
not limited to compiled object code, generated documentation,
and conversions to other media types.

"Work" shall mean the work of authorship, whether in Source or
Object form, made available under the License, as indicated by a
copyright notice that is included in or attached to the work
(an example is provided in the Appendix below).

"Derivative Works" shall mean any work, whether in Source or Object
form, that is based on (or derived from) the Work and for which the
editorial revisions, annotations, elaborations, or other modifications
represent, as a whole, an original work of authorship. For the purposes
of this License, Derivative Works shall not include works that remain
separable from, or merely link (or bind by name) to the interfaces of,
the Work and Derivative Works thereof.

"Contribution" shall mean any work of authorship, including
the original version of the Work and any modifications or additions
to that Work or Derivative Works thereof, that is intentionally
submitted to Licensor for inclusion in the Work by the copyright owner
or by an individual or Legal Entity authorized to submit on behalf of
the copyright owner. For the purposes of this definition, "submitted"
means any form of electronic, verbal, or written communication sent
to the Licensor or its representatives, including but not limited to
communication on electronic mailing lists, source code control systems,
and issue tracking systems that are managed by, or on behalf of, the
Licensor for the purpose of discussing and improving the Work, but
excluding communication that is conspicuously marked or otherwise
designated in writing by the copyright owner as "Not a Contribution."

"Contributor" shall mean Licensor and any individual or Legal Entity
on behalf of whom a Contribution has been received by Licensor and
subsequently incorporated within the Work.

2. Grant of Copyright License. Subject to the terms and conditions of
this License, each Contributor hereby grants to You a perpetual,
worldwide, non-exclusive, no-charge, royalty-free, irrevocable
copyright license to reproduce, prepare Derivative Works of,
publicly display, publicly perform, sublicense, and distribute the
Work and such Derivative Works in Source or Object form.

3. Grant of Patent License. Subject to the terms and conditions of
this License, each Contributor hereby grants to You a perpetual,
worldwide, non-exclusive, no-charge, royalty-free, irrevocable
(except as stated in this section) patent license to make, have made,
use, offer to sell, sell, import, and otherwise transfer the Work,
where such license applies only to those patent claims licensable
by such Contributor that are necessarily infringed by their
Contribution(s) alone or by combination of their Contribution(s)
with the Work to which such Contribution(s) was submitted. If You
institute patent litigation against any entity (including a
cross-claim or counterclaim in a lawsuit) alleging that the Work
or a Contribution incorporated within the Work constitutes direct
or contributory patent infringement, then any patent licenses
granted to You under this License for that Work shall terminate
as of the date such litigation is filed.

4. Redistribution. You may reproduce and distribute copies of the
Work or Derivative Works thereof in any medium, with or without
modifications, and in Source or Object form, provided that You
meet the following conditions:

(a) You must give any other recipients of the Work or
Derivative Works a copy of this License; and

(b) You must cause any modified files to carry prominent notices
stating that You changed the files; and

(c) You must retain, in the Source form of any Derivative Works
that You distribute, all copyright, patent, trademark, and
attribution notices from the Source form of the Work,
excluding those notices that do not pertain to any part of
the Derivative Works; and

(d) If the Work includes a "NOTICE" text file as part of its
distribution, then any Derivative Works that You distribute must
include a readable copy of the attribution notices contained
within such NOTICE file, excluding those notices that do not
pertain to any part of the Derivative Works, in at least one
of the following places: within a NOTICE text file distributed
as part of the Derivative Works; within the Source form or
documentation, if provided along with the Derivative Works; or,
within a display generated by the Derivative Works, if and
wherever such third-party notices normally appear. The contents
of the NOTICE file are for informational purposes only and
do not modify the License. You may add Your own attribution
notices within Derivative Works that You distribute, alongside
or as an addendum to the NOTICE text from the Work, provided
that such additional attribution notices cannot be construed
as modifying the License.

You may add Your own copyright statement to Your modifications and
may provide additional or different license terms and conditions
for use, reproduction, or distribution of Your modifications, or
for any such Derivative Works as a whole, provided Your use,
reproduction, and distribution of the Work otherwise complies with
the conditions stated in this License.

5. Submission of Contributions. Unless You explicitly state otherwise,
any Contribution intentionally submitted for inclusion in the Work
by You to the Licensor shall be under the terms and conditions of
this License, without any additional terms or conditions.
Notwithstanding the above, nothing herein shall supersede or modify
the terms of any separate license agreement you may have executed
with Licensor regarding such Contributions.

6. Trademarks. This License does not grant permission to use the trade
names, trademarks, service marks, or product names of the Licensor,
except as required for reasonable and customary use in describing the
origin of the Work and reproducing the content of the NOTICE file.

7. Disclaimer of Warranty. Unless required by applicable law or
agreed to in writing, Licensor provides the Work (and each
Contributor provides its Contributions) on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
implied, including, without limitation, any warranties or conditions
of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
PARTICULAR PURPOSE. You are solely responsible for determining the
appropriateness of using or redistributing the Work and assume any
risks associated with Your exercise of permissions under this License.

8. Limitation of Liability. In no event and under no legal theory,
whether in tort (including negligence), contract, or otherwise,
unless required by applicable law (such as deliberate and grossly
negligent acts) or agreed to in writing, shall any Contributor be
liable to You for damages, including any direct, indirect, special,
incidental, or consequential damages of any character arising as a
result of this License or out of the use or inability to use the
Work (including but not limited to damages for loss of goodwill,
work stoppage, computer failure or malfunction, or any and all
other commercial damages or losses), even if such Contributor
has been advised of the possibility of such damages.

9. Accepting Warranty or Additional Liability. While redistributing
the Work or Derivative Works thereof, You may choose to offer,
and charge a fee for, acceptance of support, warranty, indemnity,
or other liability obligations and/or rights consistent with this
License. However, in accepting such obligations, You may act only
on Your own behalf and on Your sole responsibility, not on behalf
of any other Contributor, and only if You agree to indemnify,
defend, and hold each Contributor harmless for any liability
incurred by, or claims asserted against, such Contributor by reason
of your accepting any such warranty or additional liability.

END OF TERMS AND CONDITIONS

APPENDIX: How to apply the Apache License to your work.

To apply the Apache License to your work, attach the following
boilerplate notice, with the fields enclosed by brackets "[]"
replaced with your own identifying information. (Don't include
the brackets!)  The text should be enclosed in the appropriate
comment syntax for the file format. We also recommend that a
file or class name and description of purpose be included on the
same "printed page" as the copyright notice for easier
identification within third-party archives.

Copyright (c) $(date +%Y) $@

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
LIC

cat <<CPR>> README.md

© $(date +%Y) $@

See LICENSE for details.

CPR

cat <<LIC_STUB>> license_stub.txt
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
LIC_STUB
}

# peek at a particular line in a file (decent for printf-style debugging)
show() {
    line_number=$1
    start=$(($line_number - 10))
    stop=$(($line_number + 10))

    case "$2" in
        "in")
            file_path=$3
            ;;
        *)
            echo "Usage: show <line_number> in <path_to_file>"
            ;;
    esac

    awk "NR >= $start && NR <= $stop + 10" $file_path
}

# create a new GitHub repo from the command line
newrepo() {
    w=$1
    u="damienstanton"
    if [ -z "$1" ]; then
        echo -n "Need the name of the new repo:"
        read w
    fi
    curl -u $u https://api.github.com/user/repos -d "{\"name\":\"$w\"}"
    git init && git remote add origin https://github.com/$u/$w
}

# set the current dir to an existing github remote.
remote() {
    git init && git remote add origin https://github.com/$1
}

# pretty JSON object catting
jv() {
    jq -C . $1 | less -R
}

# pretty CSV object catting
cv() {
    cat $1 | sed 's/,/ ,/g' | column -t -s, | less -S
}

# automate synchro with a third-party github repo (useful for OSS stuff)
syncwith() {
    git remote add up https://github.com/$1
    git fetch up master \
        && git merge up/master \
        && git push \
        && echo "OK"
}

