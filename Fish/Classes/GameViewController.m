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


@implementation GameViewController

@synthesize scoreLabel;
@synthesize continueButton;
@synthesize levelSelectButton;
@synthesize mainMenuButton;
@synthesize pauseButton;

Fish *theFish;
NSMutableArray *mitesArray;
float score = 0;


/*
 * What to do when the pause button is pressed
 */
-(IBAction)goToMainMenu
{
	FishViewController *menuView = [[FishViewController alloc] initWithNibName:NULL bundle:NULL];
	
	[self presentModalViewController:menuView animated:NO];
}

/*
 * What to do when the pause button is pressed
 */
-(IBAction)pause
{
	//stop the current characters from moving
	[theFish toggleTimer];
	int i = ([mitesArray count]-1);
	for (i; i >= 0; i--) {
		
		DustMite *collisionMite;
		collisionMite = [mitesArray objectAtIndex:i];
			
		[collisionMite toggleTimer];
	}
	
	//show the menu buttons
	continueButton.hidden = FALSE;
	levelSelectButton.hidden = FALSE;
	mainMenuButton.hidden = FALSE;
	pauseButton.hidden = TRUE;
}


/*
 * What to do when the pause button is pressed
 */
-(IBAction)continueGame
{
	//get the characters to resume play
	[theFish toggleTimer];
	
	int i = ([mitesArray count]-1);
	for (i; i >= 0; i--) {
		
		DustMite *collisionMite;
		collisionMite = [mitesArray objectAtIndex:i];
		
		[collisionMite toggleTimer];
	}
	
	//hide the menu buttons
	continueButton.hidden = TRUE;
	levelSelectButton.hidden = TRUE;
	mainMenuButton.hidden = TRUE;
	pauseButton.hidden = FALSE;
	
}

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		
		//instantiate the fish
		theFish = [[Fish alloc] init];
		[self.view addSubview:theFish];
		int random = rand() % 10;
		mitesArray = [[NSMutableArray alloc]initWithCapacity:10];
		
		//instantiate the mite
		for (int i = 0; i < 10; i++) {
			DustMite *theMite = [[DustMite alloc] init];
			[self.view addSubview:theMite];
			CGPoint p = CGPointMake(( random + random), (10 * (i * random)) );
			[theMite setCenter:p];
			
			[mitesArray insertObject:theMite atIndex:i];
		}
	
		
		//make a timer to check for collisions
		[NSTimer scheduledTimerWithTimeInterval:1/30.0 target:self selector:@selector(checkCollision) userInfo:nil repeats:true];
		
		

		
    }
    return self;
}

-(void)checkCollision
{
	int i = ([mitesArray count]-1);
	for (i; i >= 0; i--) {
		
		DustMite *collisionMite;
		collisionMite = [mitesArray objectAtIndex:i];
	
	if(theFish.YPos > (collisionMite.YPos-70) && theFish.YPos < (collisionMite.YPos +70)){
		if(theFish.XPos > (collisionMite.XPos-70) && theFish.XPos < (collisionMite.XPos +70))
		{
			//printf("HIT! numMites = %d\n", [mitesArray count]);
			
			
			[theFish hit];
			[collisionMite removeFromSuperview];
			[mitesArray removeObjectAtIndex:i];
			[collisionMite release];
			
			//calculate the score and update the score label	
			score = score + 10;		
			NSString *theScore = [NSString stringWithFormat:@"Score: %f",score];			  
			[scoreLabel setText:theScore];
			[scoreLabel setFont:[UIFont fontWithName:@"Suplexmentary Comic NC" size:36]];
			printf("HIT! numMites = %d\n", [mitesArray count]);
			if ([mitesArray count]  < 1) {
				printf("happend/n");
				UIAlertView *alertWithOkButto = alertWithOkButto = [[UIAlertView alloc] initWithTitle:@"WIN"
																								message:@"YOU HAVE WON! \n YOU'RE THE KING" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
				
				[alertWithOkButto show];
				[alertWithOkButto release];
			}
		}
	}
	}
	
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
