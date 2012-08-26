//
//  SkillsDao.m
//  Team02
//
//  Created by Michael Vaughan on 8/25/12.
//  Copyright (c) 2012 League of Pantless Gentlemen. All rights reserved.
//

#import "SkillsDao.h"
#import "Skill.h"

@implementation SkillsDao

-(NSArray *) getSkills {
    NSMutableArray *skills = [NSMutableArray array];
    Skill *skill1 = [[Skill alloc] init];
    [skill1 setCoordinate:CLLocationCoordinate2DMake(32.90011, -79.915778 )];
    
    Skill *skill2 = [[Skill alloc] init];
    [skill2 setCoordinate:CLLocationCoordinate2DMake(32.90352, -79.91324 )];
    
    [skills addObject:skill1];
    [skills addObject:skill2];
    
    return skills;
}

@end
