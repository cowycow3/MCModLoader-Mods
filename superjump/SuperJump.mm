#import <substrate.h>
#import <MCModInfo.h>

#define PREFS @"com.sharedroutine.mcpe.superjump"

typedef struct {
	void* vt;
	float x; // 0x4
	float y; // 0x8
	float z; // 0xc
} Entity;

typedef Entity Player;
Player *playerPtr;

void (*orig$$Player$$normalTick)(Player *player);
void Player$$normalTick(Player *player) {
	playerPtr = player;
	orig$$Player$$normalTick(player);
}

void (*orig$$Mob$$jumpFromGround)(void *mob);
void Mob$$jumpFromGround(void *mob) {
    if (mob == playerPtr) {
       float *dataPtr = (float *)mob;
       float modValue = [MCModInfo floatValueForPreferences:PREFS key:@"kSuperJump"];
       dataPtr[0x4C/sizeof(float)] = modValue > 0.42f ? modValue : 0.42f;
    } else {
	orig$$Mob$$jumpFromGround(mob);
    }
}

@interface MCPESuperJump : NSObject {
}
@end

@implementation MCPESuperJump

+(void)load {

MSHookFunction((void *)MSFindSymbol(NULL,"__ZN6Player10normalTickEv"),(void *)Player$$normalTick,(void 
**)&orig$$Player$$normalTick);

MSHookFunction((void *)MSFindSymbol(NULL,"__ZN3Mob14jumpFromGroundEv"),(void *)Mob$$jumpFromGround,(void 
**)&orig$$Mob$$jumpFromGround);

}

@end
