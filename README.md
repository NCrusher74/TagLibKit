# TagLibKit: An SPM package for:

# TaglibWrapper
A simple Objective C++ wrapper to call Taglib from Swift. This implies that you have already built and added the tag.framework to your project.

Simply add `https://github.com/NCrusher74/TagLibKit.git` branch: `master` to your Swift Package Dependencies.


## Examples:

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

**Some common key constants you could use in Swift:**
```
public enum TaglibKeys {
	public static let comment = "COMMENT"
	public static let album = "ALBUM"
	public static let bpm = "BPM"
	public static let composer = "COMPOSER"
	public static let arranger = "ARRANGER"
	public static let genre = "GENRE"
	public static let grouping = "CONTENTGROUP"
	public static let title = "TITLE"
	public static let artist = "ARTIST"
	public static let publisher = "LABEL"
	public static let isrc = "ISRC"
	public static let contentGroup = "CONTENTGROUP"
	public static let chapter = "CHAP"
	public static let albumArtist = "ALBUMARTIST"
	public static let owner = "OWNER"
	public static let copyright = "COPYRIGHT"
	public static let subtitle = "SUBTITLE"
	public static let key = "INITIALKEY"
}
```
