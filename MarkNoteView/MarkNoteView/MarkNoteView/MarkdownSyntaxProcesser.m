/**
 * MarkNoteView- A UITextView category to highlight MarkDown syntax. * Copyright (c) 2015, MarkNote. (MIT Licensed)
 * https://github.com/marknote/MarkNoteView
 */

#import <UIKit/UIKit.h>
#import "MarkdownSyntaxProcesser.h"



#define regexp(reg,option) [NSRegularExpression regularExpressionWithPattern:@reg options:option error:NULL]


@implementation MarkdownSyntaxProcesser

SyntaxRule*  buildSyntaxRule(NSRegularExpression* exp ,NSDictionary* styles){
    return [[SyntaxRule alloc] initWithExpress:exp Styles:styles];
}

- (NSArray<SyntaxRule*>*) buildRulesForMarkDown{
    return @[
             
             // headers
             buildSyntaxRule(
                             regexp("(#+)(.*)", NSRegularExpressionAnchorsMatchLines),
                             @{
                             NSFontAttributeName : [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]
                                                  }),
             //links
             buildSyntaxRule(
                             regexp("(\\!)*\\[([^\\[]*)\\]\\(([^\\)]+)\\)", 0),
                             @{NSForegroundColorAttributeName : [UIColor colorWithRed:104.0/255.0 green:224.0/255.0 blue:152.0/255.0 alpha:1.0]}),
             //bold
             buildSyntaxRule(
                             regexp("(\\*\\*|__)(.*?)\\1", 0),
                             @{NSFontAttributeName : [UIFont boldSystemFontOfSize:[UIFont systemFontSize]]}),
             //Emphasis
             buildSyntaxRule(
                             regexp("\\s(\\*|_)(.*?)\\1\\s", 0),
                             @{NSFontAttributeName : [UIFont boldSystemFontOfSize:[UIFont systemFontSize]]}),
             //deletion
             buildSyntaxRule(
                             regexp("\\~\\~(.*?)\\~\\~", 0),
                             @{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle)}),
             //quotes
             buildSyntaxRule(
                             regexp("\\:\\\"(.*?)\\\"\\:", 0),
                             @{NSForegroundColorAttributeName : [UIColor lightGrayColor]}),
            //InlineCode
            buildSyntaxRule(
                regexp("`(.*?)`", 0),
                @{NSForegroundColorAttributeName : [UIColor brownColor]}),
                            //block Code
                            buildSyntaxRule(
                                            regexp("```([\\s\\S]*?)```", 0),
                                            @{
                                              NSBackgroundColorAttributeName : [UIColor colorWithRed:0.99 green:0.99 blue:0.99 alpha:1.0]
                                              }),
             //Blockquotes
             buildSyntaxRule(
                             regexp("\n(&gt;|\\>)(.*)",0),
                             @{NSBackgroundColorAttributeName : [UIColor colorWithRed:125.0/255.0 green:210.0/255.0 blue:209.0/255.0 alpha:1.0]
                               }),
             /*//ULLists
             buildSyntaxRule(
                             regexp("^\\-([^\\*]*)", NSRegularExpressionAnchorsMatchLines),
                             @{}),
             //InlineCode
             buildSyntaxRule(
                             regexp("^[0-9]+\\.(.*)",
                             @{}),*/
             //HTML tags
             buildSyntaxRule(
                             regexp("<[^>]+>", 0),
                             @{NSForegroundColorAttributeName : [UIColor colorWithRed:1.0 green:106.0/255.0 blue:0.0 alpha:1.0]})

             
             ];
}


- (NSMutableArray<SyntaxOccurance*> *)process:(NSString *) text; {
    NSMutableArray *markdownSyntaxModels = [NSMutableArray array];
    NSArray<SyntaxRule*>* rules = [self buildRulesForMarkDown];
    
    for (SyntaxRule * rule in rules) {
        
        NSArray *matches = [rule.express matchesInString:text
                                       options:0
                                       range:NSMakeRange(0, [text length])];
        for (NSTextCheckingResult *result in matches) {
            SyntaxOccurance* occurance = [[SyntaxOccurance alloc] initWithRange:result.range styles:rule.styles];
            [markdownSyntaxModels addObject:occurance];
        }
    }
    return markdownSyntaxModels;
}
@end