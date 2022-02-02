# Bash Scripts

These are some simple bash scripts I created for personal use.

## Scripts

<details>
<summary>gitdo</summary>

Usage: `gitdo [options] <commit message>`

A wrapper for frequently used git commands. When run, it shows the results of `git status` and adds, commits, and pushes automatically. Default behaviour can be customized. See `gitdo -h` for in-depth help.

Example:
```bash
# Add and commit all changes
$ gitdo "Commit message here"
# Add and commit without asking for confirmation (a stands for auto)
$ gitdo -a "Commit message here"
# Add, commit, and push without asking for confirmation
$ gitdo -pa "Commit message here"
# Add, commit, and push to 'upstream' without confirmation
$ gitdo -par upstream "Commit message here"
```
<hr>
</details>

<details>
<summary>play</summary>

Usage: `play [keyword]`

When invoked, the script checks the music directory and tries to find a playlist (.xspf extension) and opens it in vlc. If no playlist is found it checks the Albums folder and finds any album with the given keyword and play those in vlc. If no albums are found, it searches the whole music directory, including song/artist names and adds everything that contains the keyword and plays it in vlc.

The root music directory should be set as an environment variable PLAYLIST_ROOT.
`export PLAYLIST_ROOT="/path/to/music"`
<hr>
</details>

<details>
<summary>svcstat</summary>

Usage: `svcstat [-oneline | -o | stopall]`

Helps to monitor the status of services, specially when you start/stop them frequently. The services checked by the script are in an array, where you can add new services or remove them easily. When invoked with root permissions and the parameter 'stopall' (i.e `$ svcstat stopall`) all services in the array will be stopped.

The `-o` or `-oneline` options trim the output and just show whether the service is active or not.
<hr>
</details>

## My setup
Store the scripts wherever. I have the `~/bin` directory added to path. Then I create symbolic links to the scripts.

```bash
# in ~/.bashrc
export PATH="$PATH:~/bin"

$ cd ~
$ mkdir bin
$ ln -s ${script_location}/play ~/bin/play
```
You might want to make the scripts executable first.
`$ chmod u+x {script}`

