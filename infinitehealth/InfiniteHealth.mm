#import <substrate.h>
#import <mach-o/dyld.h>
#import <MCModInfo.h>

#define PREFS @"com.sharedroutine.mcpe.infinitehealth"

void SHHookPointer(void* entry, const void* replace, void** orig) {
	uintptr_t p = (uintptr_t)replace;
	if(*(void**)entry == replace) {
		/* if already hooked, don't do anything */
		return;
	}
	if(orig) *orig = *(void**)entry;
	*(void**)entry = (void*)p;
}

typedef struct {
	bool invulnerable;
	bool flying;
	bool mayfly;
	bool instabuild;
} Abilities;

void (*orig$$SurvivalMode$$initAbilitites)(void *survivalMode, Abilities *abilities);
void SurvivalMode$$initAbilitites(void *survivalMode, Abilities *abilities) {
	orig$$SurvivalMode$$initAbilitites(survivalMode,abilities);
	abilities->invulnerable = [MCModInfo boolValueForPreferences:PREFS key:@"kInfiniteHealth"];;
}

@interface MCPEInfiniteHealth : NSObject {
}
@end

@implementation MCPEInfiniteHealth

+(void)load {

uintptr_t *SurvivalModeVT = (uintptr_t *)MSFindSymbol(NULL,"__ZTV12SurvivalMode")+0x2;
	SHHookPointer((void *)&SurvivalModeVT[22],(void *)SurvivalMode$$initAbilitites,(void 
**)&orig$$SurvivalMode$$initAbilitites);

}

@end
