//
//  HZAutoFitScreen.h
//  SpriteKitSimpleGame
//
//  Created by Red-Fish on 2023/8/17.
//  Copyright © 2023 chc. All rights reserved.
//

#ifndef HZAutoFitScreen_h
#define HZAutoFitScreen_h

#define FitFloor(value) floor([UIScreen mainScreen].bounds.size.width / 432.0 * value)
#define FitRoundf(value) roundf([UIScreen mainScreen].bounds.size.width / 432.0 * value)
#define FitFloat(value) ([UIScreen mainScreen].bounds.size.width / 432.0 * value)

#define FitFontSize(fontSize) FitFloat(fontSize)

#define FitFontNormal(font) [UIFont systemFontOfSize:FitFloat(font)]
#define FitFontMedium(font) [UIFont systemFontOfSize:FitFloat(font) weight:UIFontWeightMedium]
#define FitFontBold(font) [UIFont boldSystemFontOfSize:FitFloat(font)]

#endif /* HZAutoFitScreen_h */
