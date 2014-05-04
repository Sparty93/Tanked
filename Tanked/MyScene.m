//
//  MyScene.m
//  Tanked
//
//  Created by Robert Marchiori on 3/22/14.
//  Copyright (c) 2014 Robert Marchiori. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.physicsWorld.gravity = CGVectorMake(0.0, -0.05f);
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        for (int i = 1; i<2; i++) {
            [self createFishToAttack];
        }

    }
    return self;
}

-(void)createFishToAttack {
        SKSpriteNode *attackFish = [SKSpriteNode spriteNodeWithImageNamed:@"tankedFish"];
        attackFish.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame));
        attackFish.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(40,40)];
        attackFish.zPosition = 100;
        attackFish.physicsBody.mass = -1;
        attackFish.xScale = 1;
        attackFish.yScale = 1;
    
        [self addChild:attackFish];
    
        //Next attack fish spawn
    
        /*static const CGFloat thrust = 0.12;
    
        CGFloat fishDirection = .5;
        CGVector thrustVector = CGVectorMake(thrust*cosf(fishDirection),
                                         thrust*sinf(fishDirection));*/
    
        [attackFish.physicsBody applyForce:CGVectorMake(200, 200)];
    
          [self runAction:[SKAction sequence:@[
            [SKAction waitForDuration:5],
            [SKAction performSelector:@selector(createFishToAttack) onTarget:self],
            //[SKAction performSelector:@selector(createFishToAttack) onTarget:self],
        ]]];
    
        /*
        UIBezierPath *randomPath = [UIBezierPath bezierPath];
        [randomPath moveToPoint:CGPointMake(20, 20)];
        [randomPath addCurveToPoint:CGPointMake(50, 50)
                  controlPoint1:CGPointMake(200, 200)
                  controlPoint2:CGPointMake(300, 50)];

        SKAction *forever = [SKAction followPath:CFBridgingRetain(randomPath) duration:5];
         [attackFish runAction:forever];
         */

}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
