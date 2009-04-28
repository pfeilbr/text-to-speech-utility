#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	if (argc != 3) {
		NSLog(@"usage: %s text file", argv[0]);
		return 1;
	}
	
	// text to speak
	NSString *text = [NSString stringWithCString:argv[1]];
	
	// file to save to
	NSString *path = [NSString stringWithCString:argv[2]];
	
	NSSpeechSynthesizer *speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:[NSSpeechSynthesizer defaultVoice]];
	
	// synthesizes text into a sound (AIFF) file
	[speechSynth startSpeakingString:text toURL:[NSURL fileURLWithPath:path]];
	
	// wait until async speech is complete
	while([speechSynth isSpeaking]) {
		sleep(1);
	}
	
    [pool drain];
    return 0;
}
