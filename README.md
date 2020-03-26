# TaglibWrapper
A simple Objective C++ wrapper to call Taglib from Swift

###### Import into your Bridging Header:
#import "TaglibWrapper.h"

###### Examples:

**Get MP3 Chapters:**
```
if let array = TaglibWrapper.getChapters(audioURL.path) as? [String] { ... }
```
**Save MP3 Chapters:**
Pass an array of strings formatted like: "CHAPTER_TITLE@TIME_IN_MILLISECONDS"
```
let array = markers.map({ marker -> String in
    marker.name + "@" + String(Int(marker.time * 1000))
})
TaglibWrapper.setChapters(url.path, array: array)
```
**Get metadata as NSDictionary:**
```
guard let tag = TaglibWrapper.getMetadata(audioURL.path) else { ... }
```

**Set metadata from Dictionary:**
```
var dict = [String: String]()
dict["COMMENT"] = "Hi"

// general common tags
dict["TITLE"] = metadata.title
dict["ARTIST"] = metadata.composer
dict["COMPOSER"] = metadata.composer
dict["ALBUM"] = metadata.album
dict["GENRE"] = metadata.genre
dict["PUBLISHER"] = metadata.publisher
dict["BPM"] = String(metadata.bpm)

TaglibWrapper.setMetadata(path, dictionary: dict)
```