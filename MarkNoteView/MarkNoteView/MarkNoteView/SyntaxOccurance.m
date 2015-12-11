/**
 * MarkNoteView- A UITextView category to highlight MarkDown syntax. * Copyright (c) 2015, MarkNote. (MIT Licensed)
 * https://github.com/marknote/MarkNoteView
 */

#import "SyntaxOccurance.h"




@implementation SyntaxOccurance {

}
- (instancetype)initWithRange:(NSRange) range styles:(NSDictionary*) styles {
    self = [super init];
    if (self) {
        _styles = styles;
        _range = range;
    }
    return self;
}



@end