/**
 * MarkNoteView- A UITextView category to highlight MarkDown syntax. * Copyright (c) 2015, MarkNote. (MIT Licensed)
 * https://github.com/marknote/MarkNoteView
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "MarkdownSyntaxProcesser.h"


@interface UITextView(MarkNoteView)
- (void)updateSyntax;
@end