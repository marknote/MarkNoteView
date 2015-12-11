//
//  MarkdownRule.h
//  MarkNoteView
//
//  Created by bill on 11/12/15.
//  Copyright © 2015 markNote. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SyntaxRule : NSObject{
    NSRegularExpression* _express;
    NSDictionary* _styles;
}


@property (readonly) NSRegularExpression* express;
@property (readonly) NSDictionary* styles;

-(instancetype) initWithExpress:(NSRegularExpression*) exp Styles:(NSDictionary*) styles;

@end
