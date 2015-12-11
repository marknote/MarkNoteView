/**
 * MarkNoteView- A UITextView category to highlight MarkDown syntax. * Copyright (c) 2015, MarkNote. (MIT Licensed)
 * https://github.com/marknote/MarkNoteView
 */

#import <Foundation/Foundation.h>
#import "SyntaxRule.h"



@interface SyntaxOccurance : NSObject{
    NSRange _range;
    NSDictionary* _styles;
}
@property(readonly) NSRange range;
@property (readonly) NSDictionary* styles;

- (instancetype)initWithRange:(NSRange) range styles:(NSDictionary*) styles;


@end