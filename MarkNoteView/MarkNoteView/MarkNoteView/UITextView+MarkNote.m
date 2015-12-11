/**
 * MarkNoteView- A UITextView category to highlight MarkDown syntax. * Copyright (c) 2015, MarkNote. (MIT Licensed)
 * https://github.com/marknote/MarkNoteView
 */

#import "UITextView+MarkNote.h"
#import "MarkdownSyntaxProcesser.h"
#import "SyntaxOccurance.h"





@implementation UITextView(MarkNoteView)




- (MarkdownSyntaxProcesser *)markdownSyntaxGenerator {
    static MarkdownSyntaxProcesser *_markdownSyntaxGenerator = nil;
    if (_markdownSyntaxGenerator == nil) {
        _markdownSyntaxGenerator = [[MarkdownSyntaxProcesser alloc] init];
    }
    return _markdownSyntaxGenerator;
}

- (void)updateSyntax {
    NSArray *occurances = [[self markdownSyntaxGenerator] process:self.text];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attributedString setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.0]} range:NSMakeRange(0, [attributedString length])];
    for (SyntaxOccurance *occurance in occurances) {
        [attributedString addAttributes:occurance.styles range:occurance.range];
    }
    [self updateAttributedText:attributedString];
}

- (void)updateAttributedText:(NSAttributedString *) attributedString {
    self.scrollEnabled = NO;
    NSRange selectedRange = self.selectedRange;
    self.attributedText = attributedString;
    self.selectedRange = selectedRange;
    self.scrollEnabled = YES;
}


@end