#import <substrate.h>
#import <MCModInfo.h>

#define PREFS @"com.sharedroutine.mcpe.speedmod"

float (*orig$$Player$$getWalkingSpeedModifier)(void *player);

float Player$$getWalkingSpeedModifier(void *player) {

float orig = orig$$Player$$getWalkingSpeedModifier(player);
float mod = [MCModInfo floatValueForPreferences:PREFS key:@"kSpeed"];
return mod > orig ? mod : orig;

}

@interface MCPESpeedMod : NSObject {
}
@end

@implementation MCPESpeedMod

+(void)load {

MSHookFunction((void *)MSFindSymbol(NULL,"__ZN6Player23getWalkingSpeedModifierEv"),(void *)Player$$getWalkingSpeedModifier,(void 
**)&orig$$Player$$getWalkingSpeedModifier);

}

@end
