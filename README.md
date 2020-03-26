# TaglibWrapper
Simple Objective C++ wrapper to call Taglib from Swift

Import into your Bridging Header:
#import "TaglibWrapper.h"

Examples:

Get MP3 Chapters:
if let array = TaglibWrapper.getChapters(audioURL.path) as? [String] { ... }

Save MP3 Chapters, pass an array of strings like: CHAPTER_TITLE@TIME_IN_MILLISECONDS
let array = markers.map({ marker -> String in
    marker.name + "@" + String(Int(marker.time * 1000))
})
return TaglibWrapper.setChapters(url.path, array: array)

Get metadata as NSDictionary:
guard let tag = TaglibWrapper.getMetadata(audioURL.path) else { ... }
