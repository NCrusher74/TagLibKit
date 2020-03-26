# TaglibWrapper
Simple Objective C++ wrapper to call Taglib from Swift

Import into your Bridging Header:
#import "TaglibWrapper.h"

Examples:

<b>Get MP3 Chapters:</b>
if let array = TaglibWrapper.getChapters(audioURL.path) as? [String] { ... }

<b>Save MP3 Chapters:</b>
Pass an array of strings formatted like: "CHAPTER_TITLE@TIME_IN_MILLISECONDS"

let array = markers.map({ marker -> String in
    marker.name + "@" + String(Int(marker.time * 1000))
})
TaglibWrapper.setChapters(url.path, array: array)

<b>Get metadata as NSDictionary:</b>
guard let tag = TaglibWrapper.getMetadata(audioURL.path) else { ... }

<b>Set metadata from Dictionary:</b>

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
