//
//  GameViewController.m
//  Fish
//
//  Created by Daniel Loomb on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameViewController.h"
#import "FishViewController.h"
#import "Fish.h"
#import "DustMite.h"
#import "AnimalFur.h"
#import "Pollen.h"
#import "PreventerLining.h"
#import "PreventerArray.h"
#import <stdlib.h>
#import <UIKit/UIKit.h>


@implementation GameViewController

@synthesize scoreLabel;
@synthesize continueButton;
@synthesize levelSelectButton;
@synthesize mainMenuButton;
@synthesize pauseButton;

PreventerArray *theLining;
Fish *theFish;
NSMutableArray *triggersArray;
NSTimer *gameTimer;
int score = 0;


/*
 * What to do when the pause button is pressed
 */
-(IBAction)goToMainMenu{
	FishViewController *menuView = [[FishViewController alloc] initWithNibName:NULL bundle:NULL];
	
	[self presentModalViewController:menuView animated:NO];
}

/*
 * What to do when the pause button is pressed
 */
-(IBAction)pause{
	
	//Prevents Screen Locking
	[UIApplication sharedApplication].idleTimerDisabled = NO;
	//stop the current characters from moving
	[theFish toggleTimer];

	[self toggleTimer];
	//show the menu buttons
	continueButton.hidden = FALSE;
	levelSelectButton.hidden = FALSE;
	mainMenuButton.hidden = FALSE;
	pauseButton.hidden = TRUE;
}


/*
 * What to do when the pause button is pressed
 */
-(IBAction)continueGame{
	//Prevents Screen Locking
	[UIApplication sharedApplication].idleTimerDisabled = YES;
	
	//get the characters to resume play
	[theFish toggleTimer];
	
	[self toggleTimer];	
	
	//hide the menu buttons
	continueButton.hidden = TRUE;
	levelSelectButton.hidden = TRUE;
	mainMenuButton.hidden = TRUE;
	pauseButton.hidden = FALSE;
	
}

-(void)toggleTimer{
	if(gameTimer == nil){//if the timer is currently empty then set it
		gameTimer = [NSTimer scheduledTimerWithTimeInterval:1/30.0 target:self selector:@selector(updateGame) userInfo:nil repeats:true];
	}
	else{//else stop the timer 
		[gameTimer invalidate];
		gameTimer = nil;
	}
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		
		//Prevents Screen Locking
		[UIApplication sharedApplication].idleTimerDisabled = YES;	
		//instatiate timer
		gameTimer = [NSTimer scheduledTimerWithTimeInterval:1/30.0 target:self selector:@selector(updateGame) userInfo:nil repeats:true];
		
		//instantiate the fish
		theFish = [[Fish alloc] init];
		[self.view addSubview:theFish];
		triggersArray = [[NSMutableArray alloc]initWithCapacity:10];
		
		//instantiate the mite
		BOOL spawnSwitch1 = FALSE;
		BOOL spawnSwitch2 = FALSE;
		for (int i = 0; i < 20; i++) {
			if (spawnSwitch1 == FALSE ) {
				if (spawnSwitch2 == FALSE) {
					AnimalFur *theFur = [[AnimalFur alloc] init:(300 + (20*i)):50];
					[self.view addSubview:theFur];
					[triggersArray insertObject:theFur atIndex:i];
					
					spawnSwitch2 = TRUE;
				}
				else {
					Pollen *aPollen = [[Pollen alloc] init:(300 + (20*i)):50];
					[self.view addSubview:aPollen];
					[triggersArray insertObject:aPollen atIndex:i];
					spawnSwitch2 = FALSE;
				}
				spawnSwitch1 = TRUE;
			}
			else {
				DustMite *theMite = [[DustMite alloc] init:(300 + (20*i)):50];			
				[self.view addSubview:theMite];
				[triggersArray insertObject:theMite atIndex:i];
				spawnSwitch1 = FALSE;
			}
			
			
		}
		
		
		//instantiate the lining
		theLining = [[PreventerArray alloc] init];
		[theLining createArray:25 :75];
		
		
		for(PreventerLining *pLining in [theLining getArray]){
		    [self.view addSubview:pLining];		
		}
		

		
		
		
		
    }
    return self;
}

-(void)updateGame{
	int i = ([triggersArray count]-1);
	for (i; i >= 0; i--) {
		DustMite *updateMite = [triggersArray objectAtIndex:i];
		[updateMite update:theFish];
	}
	[self checkCollision];
}

-(void)checkCollision
{
	int i = ([triggersArray count]-1);
	for (i; i >= 0; i--) {
		
		DustMite *collisionMite;
		collisionMite = [triggersArray objectAtIndex:i];
		
		if(theFish.YPos > (collisionMite.YPos-40) && theFish.YPos < (collisionMite.YPos +40)){
			if(theFish.XPos > (collisionMite.XPos-40) && theFish.XPos < (collisionMite.XPos +40))
			{
				printf("HIT! numMites = %d\n", [triggersArray count]);
				
				
				[theFish hit];
				[collisionMite removeFromSuperview];
				[triggersArray removeObjectAtIndex:i];
				[collisionMite release];
				
				//calculate the score and update the score label	
				score = score + 10;		
				NSString *theScore = [NSString stringWithFormat:@"Score: %i",score];			  
				[scoreLabel setText:theScore];
				[scoreLabel setFont:[UIFont fontWithName:@"Suplexmentary Comic NC" size:36]];
				printf("HIT! numMites = %d\n", [triggersArray count]);
				if ([triggersArray count]  < 1) {
					printf("happend/n");
					UIAlertView *alertWithOkButto = alertWithOkButto = [[UIAlertView alloc] initWithTitle:@"WIN"
																								  message:@"YOU HAVE WON! \n YOU'RE THE KING" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
					
					[alertWithOkButto show];
					[alertWithOkButto release];
				}
			}
		}
	}
	
	for(DustMite *mite in triggersArray){
		[theLining checkCollisionWithTrigger: mite];
	}
	
	[theLining checkHealthOfLinings];
	
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	//set all the Fonts to our games font
	[continueButton.titleLabel setFont:[UIFont fontWithName:@"Suplexmentary Comic NC" size:36]];
	[levelSelectButton.titleLabel setFont:[UIFont fontWithName:@"Suplexmentary Comic NC" size:36]];
	[mainMenuButton.titleLabel setFont:[UIFont fontWithName:@"Suplexmentary Comic NC" size:36]];
	[scoreLabel setFont:[UIFont fontWithName:@"Suplexmentary Comic NC" size:36]];
	/*
	 ............  ...................   . .     . ............................................  . ...... $M. . .................................
	 .   .  ..  ................... 7MMM~.:MMMMMMI..,,,,,, .... .   .... .....  ..........  .?NMMMMMM+M~..=M. 8MMMMMMMMO ........................
	 ...........................DMM .. M.MM     . O88MO88 .... MMZ...,M~.....=M. .........MM.  M.....M~  =M. ,M.................................
	 .  ........................MM+.. .D.MM..........M ........M MM...M~.....=M. ..............M.....MM887M.  MMM ..............................
	 ............   .  .   .  .....OMMMMM.MMOOOO=.....M .......=MMMMMD.M~.....=M. ..............M.....M~..=M. .M.................................
	 ..............  .. ..  .. ..MM~  ,$M.OM~.  .  ...M ...... OM ..M..M:   ..=M.... ...........M ....M~.  O.. M.................................
	 .  ... .  .    .. ..  .. ....7II= . ,I+7$7I ....: ...... ,~ ..M..MMMMMM  MMMMMMN .........M.... ~....... MMMMM.............................
	 ........ .. .. ...... ... ..............................~~~~ZOO8MMMMMMMMMMMMMMMMMZ: .......O..............     .............................
	 ....... ....... ...... ...... ...... ...... ...... ...  ............   .  .   ....M ..  .   .  .   .  .                                     
	 .......     ..  .. ..  .. ... .. ... .. ... ...... .......................................................... ...... ...... ...... ...... ..
	 . ..... .  .  . ........ .... ...... ...... ...... ...  ..  .  ..  .  ..  .  ..  .  ..  .  ..  .  ..  .   .  .   .  . ........ .  .   .  .  
	 .......  .. ..  .. ..  .....  .. ... .. ... .. ... ..............................................  ....... .. ... .. ....=+.... .. ... .. ..
	 ....... .  ....... .......+==....... ...... .MMMMMM....=MMMM~  .Z...  8 .,:::::,.. .?MMMD   .  .M=MM  .   .  .   .. .:++=+,... .  .   .  .  
	 ....... ....... ......  ..~++++~.... ......  M.... ..DMI .  MM ?MN..  M ?ZZMMZZ+ ~MM: . M.  .  . MMD  .         ..,++++++....               
	 .......     ..  .. ..  ....++++++:.. .. ... .MDNMM..?M  .....M M$MM ..M....MM ...OMN. ..M, ..... . =............++++++++ .. ...... ...... ..
	 . ..... .  .  . ...... ....+++=+++:. ......  M.  . .MI  ..  ND M= MM.NN   .MM .  . ~8MMMM7 ..  .  :.  .   ...+=+=+++++=.....   .  .   .  .  
	 ............  ..  .....  ..,+++++++=........ M .... $MMM7ZMM7..M.  DMM~.  .NM..  MMD..,?MO ...,=~,8.  ....=++++++++++,......................
	 . ..........................+++++++++=.......O......8++?,,  ...M ..=+M..  ..  .  . :?=~....==++~..M....:++++++++++++........................
	 ....... .  ... .   .. .  ...~++++++++++~.............+++..........,+==~....... ...... ..:+++=+....M..+=++++++++++++.........................
	 .........  .....  .....  ....++++++++++++=...........++++...... ..+++++...... ........:++++++.....N+++++++++++++++..........................
	 .............................=++++++++++++++,.......:+++++,......,+++++.............,+++++++,...++$++++++++++++++...........................
	 ............  ..  .....  .....=+=+++++++++++++~.....,++++++=.....=+++++,  ........,+++++++==.+++++?++++++++++=++............................
	 . .............................+++++++++++++++++:...,++++++++. ..+++++==  ... ...+++++++++++=++++I++++++++++++=.............................
	 ....... .  ... .   .. .  ......+=+++++++++++++++++..,+++++++++~..+++++++......:++++++++++++++++++N++++++++++++..............................
	 .........  .....  .....  .......++++++++++++++++++=~,++++++++++===++++++....++++=++++++++++++++++M+++++++++++...............................
	 ...........  ..  .....  .......=++++++++++++++++++++++++++++=++++++=+++:=+++++++++++=+++++++++++M+++++++++=................................
	 .................................=+++++++++++++++++++++++++OM8=:::::::MM+++++++++=++DMMM??+++++++M+++++++++.................................
	 ....... .  .....   .. .  ........~++++++++++++++++++++++MO::,::,::::::,~MO++++++++M=.....M++++++??++++++++..................................
	 .........  .,++=.......  .........+++++++++++++++++++++++++NO::::::::::::M==NNNNMM,. .., .M=++++N++++++++...................................
	 ..............=++++=...............+++++++++++++++++++++++++=NN::::DMM=:.~.......M.... . .M+++++M+++++++....................................
	 ............  ..++++++=............~+++++++++++++++++++++++++=?ZM,......  ..... .MM...   N?=++++M=+++++.....................................
	 ..................+++++++=..........+++++++++++++++++++++++++DM. ..... .  .    .. MM8 .,N.:I++++D+++++~.....................................
	 ....... .  ... ....=++++++++=........+++++++++++++++++++?M~.+M,. .......OD+Z. ..+Z  ,~.  ..=I+++I=++++......................................
	 ............... .....+++=++++++=.....~+++++++++++++++++I~.... Z..  ..MM. $?MOMMMMM$.........D++7?++++.......................................
	 ......MNO.,... .  ....++++++++++++++,.=+++++++++++++++=M O.....N .MM...MMMMMMMMMMMMD.........M+D+=++:.......................................
	 .....MM::MZ....... ....++++++++++++++++++++++++++++++++O,.... ~:M .?8MMMMMMMMMMMMMMM.........=IN++++........................................
	 :...$D::::~M$.. ........~+++++++++++++++++++++++++++++++88 . M+M .MMMMMMMMMMMMMMMMMMM.........DM+++..................................:++==..
	 M:N~::~::::::M..  .   .  :+++++++++++++++++++++++++++++++++M. D.:MMMMMMMMMMMMMMMMMMMM.........MM+++............................ ,++++++~....
	 +N::::::::::::N+...... ....=+++++++++++++++++++++++++++++++M.  MNMMMMMMMMMMMMMMMMMMMM.........MD++.....:=+++++=,............:++++++++:......
	 ~:::::::::::::~:M..   .......+++++++++++++++++++++++++++++++=..  MMMMMMMMMMMMMMMMMMMM=.......ZMI++=+==+++++++:...........++++++++=+,........
	 =~:::::::::::::::O....:++++++++++++++++++++++++++++++++++++7M......MMMMMMMMMMMMMMMMMMM.......NZ?+++++++++++=.........,+++++++++++:..........
	 Z?:::::::::::::::I+ . ...++=++++++++++++++++++++++++++++++++OO......7MMMMMMMMMMMMMMMMM.......M7N++++++++++..... .,+++++++++++++.............
	 .M~:::::::::::::::M  . ...+++++++++++++++++++++++++++++++++++M~.......MMMMMMMMMMMMMMN=.......Z7N+++++++++.....:++++++++++++++...............
	 ..M~:::::::::::::::,. .  ...++++++++++++++++++++++++++++++++++M.......DMMMMMMMMMMMMMMZ..... MI77O++++++=...+=+++++++++++=+~.................
	 ...M~::::::::7:::~:,.........=+++++++++++++++++++++++++++++++++M......:MMMMMMMMMMMM8.+.....$$I77M?+++=~,=+++++++++++++++~...................
	 ....M?::::::::::~:O  . .. .....+=++++++++++++++++++++++++++++=N?M.....,8MMMMMMMMMM, O......NI77I$D++++++++++++++++++++:.....................
	 .....MM~::::~M:M8ON....  .......:=+=+++++++++++++++++++++++8M=++O?.....D~ .MNND+ .+M......MI7777IM++++++++++++++++++:.......................
	 ....... ......DOOOOM.. ...........++++++++++++++++++++++IM?++++++M$....  .ZMMMMMOO~ .... M$I7777I7?+++++++++++++++:.........................
	 ...............~NOOO8+...:=+++++=+++++++++++++++++++++MN+=++++++++M?.......   ..........+877777777N++++++++++++++...........................
	 .................MOOOOM+++++++++=++++++++++++++++++8M+=++++++++++++IM.................MM$I7I777777M+++++++++++++............................
	 ...............,++MOOOOM+++++++++++++++++++++++++M7+++++++++++++++++M7MN,...     .?MN7I777777777777?++++++++++..............................
	 ..................~$MOOON7++++++++++++++++++++NM+++++++++++++++++++++M7I777$ZZZZZ77777777777777777IM++++++++:...............................
	 ......++++++~, ......MOOOO8++++++++++++++++IM++++++++++++++++++++++++8I77777II77777777777777777777ID+++++++++++++++++++++++++++=:,,.........
	 ......,+++++++++++=:..N8OOOM+++++++++++++N8+++++++++++++++++++++++++++M7777777777777777777777777777IO+++++++++++++++++++++++++++++++++++~...
	 .......,++++++++=++++++7MOOOM+++++++++8M+=+++++++++++++++++++++++++++++D777777777777777777777777777IM++++++++++++++++++++++++++++++++++++++,
	 .........++++++++++++++++MOOOO8++++=MI+++++++++++++++++++++++++++++++++D77I7777777777777777777777777Z7+++++++++++++++++++++++++++++++++++++=
	 .........,++++++++++++++++M8OO8M+N8+++++++++++++++++++++++++++++++++++++D7I7777777777777777777777777IM=++++++++++++++++++++++++++++++~,.....
	 ..........=+++++++++++++++++NO8MM=++++++++++++++++++++++++++++++++++++++D777777777777777777777777777ID++++++++++++++++++++++++++=...........
	 ...........+++++++++++++++++NMOOO8M+++++++++++++++++++++++++++++++++++++=MI777777777777777777777777777?++++++++++++++++=+++=,...............
	 ............++++++++++++++++++M8OOOM+++++++++++++++++++++++++++++++++++++MI7777777777777777777777777IID++++++++++++++=+~....................
	 .............++++++++++++++++++7NOOOM++++++++++++++++++++++++++++++++++++M77777777777777777777777777IID++++++++++++=........................
	 ..............++++++++++++++++=+?M8OON8++++++++++++++++++++++++++++++++++MI7777777777777777777777777IID+++++++++,...........................
	 ...............+++++++++++++++++++MOOOOM+++++++++++++++++++++++++++++++++N77777777777777777777777777IID++++++...............................
	 ................=++++++++++++++++++INOOOM=++++++++++++++++++++++++++++++7$77777777777777777777777777IID++++++...............................
	 .............. ..,+++++++++++++++++++NOOO88+++++++++++++++++++++++++++++MI77777777777777777777777777IID++++++++:............................
	 ............... ...+++++++++++++++++++NOOOOM++++++++++++++++++++++++++++M777777777777777777777777777IID++++++++++...........................
	 .............. ....,+++++++++++++++++++N8OOOM+=+++++++++++++++++++++++++ZI77777777777777777777777777IID+++++++++++..........................
	 */
	
    [super viewDidLoad];
}






- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
