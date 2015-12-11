/**
 * MarkNoteView- A UITextView category to highlight MarkDown syntax. * Copyright (c) 2015, MarkNote. (MIT Licensed)
 * https://github.com/marknote/MarkNoteView
 */


#import <Foundation/Foundation.h>
#import "SyntaxOccurance.h"




@interface MarkdownSyntaxProcesser : NSObject
- (NSArray<SyntaxOccurance*> *)process:(NSString *) text;
@end