# local_git

In this repository, you can manage local file by git.

## disable git push command in this repository
```
./init.sh
```

## update local files under git management
```
./hardlink.sh
```

if your OS is Mac OS X, technically files are copied not hardlink

* FYI: Directory hard links are not supported by Apple File System
  * [hardlink in APFS macOS High Sierra 10\.13 · Issue \#31 · selkhateeb/hardlink]( https://github.com/selkhateeb/hardlink/issues/31#issuecomment-332993819 )
  * `brew install hardlink-osx`の`hln`でも`hln: Operation not permitted`となる(もちろん，`SIP`機能をdisableにしても...)
