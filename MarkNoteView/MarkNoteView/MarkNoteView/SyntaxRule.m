//
//  MarkdownRule.m
//  MarkNoteView
//
//  Created by bill on 11/12/15.
//  Copyright © 2015 markNote. All rights reserved.
//

#import "SyntaxRule.h"

@implementation SyntaxRule

-(instancetype) initWithExpress:(NSRegularExpression*) exp Styles:(NSDictionary*) styles{
    self = [super init];
    if( self){
        _express = exp;
        _styles = styles;
    }
    return self;
}

@end
