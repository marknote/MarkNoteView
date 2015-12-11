# MarkNoteView

A UITextView category to highlight MarkDown syntax.

- Set background color for **code** blocks
- Highlight **html** tags
- Highlight **links** and **image** tags

A simple demo has been provided in the code

![Screen](https://raw.githubusercontent.com/marknote/MarkNoteView/master/screen.png)

## Usage
- Put a `UITextView` on you UI either by InterfaceBuilder or code
- Copy and add all files under `MarkNoteView` sub folder into your project
- Include the head file in your viewcontroller

```
#import "UITextView+MarkNote.h"
```
- When your text changes, call `updateSyntax ` method

```
- (void)textViewDidChange:(UITextView *)textView{
    
    [_textView updateSyntax];
}
```
- That is it!

Feel free to check the demo app
## App

MarkNoteView is used in my app [MarkNote](https://itunes.apple.com/us/app/marknote/id991297585?ls=1&mt=8)


## Questions and feedback

Twit me @markmarknote https://twitter.com/markmarknote
