{The Coolest Tic Tac Toe Game Ever
v0.5
by Steev
2004.04.19
This needs work, but it can beat me.  Of course, I always sucked at Tic Tac Toe.

This code is distributed with NO LICENSE.  If it messes up your computer, don't blame me.

This should compile in a Turbo Pascal compiler, if you can find one.}
 
program tictactoe;
uses
          wincrt;
var
   player,played,quit:boolean;
   a,b,c,d,e,f,g,h,i,square,playerchar,compchar:char;
   numcat,numhumanwin,numcompwin,winner:integer;

procedure center(line:string); {this procedure centers a line of text on the screen}
          var
             tab,len:integer;
          begin
               len:=length(line);
               tab:=(78-len) div 2;
               writeln(' ':tab,line);
          end;

procedure delay; {this procedure creates a delay}
          var a:longint;
          begin
               for a:= 1 to 100000000 do;
          end;

procedure intro; {this is the splash screen at the beginning of the program}
          begin
               center('The Coolest Tic Tac Toe Game Ever');
               center('---------------------------------');
               writeln;
               center('   _--_     _--_    _--_     _--_     _--_     _--_     _--_     _--_         ');
               center('  (    )~~~(    )  (    )~~~(    )   (    )~~~(    )   (    )~~~(    )        ');
               center('   \           /    \           /     \           /     \           /         ');
               center('    (  '' _ `  )      (  '' _ `  )       (  '' _ `  )       (  '' _ `  )          ');
               center('     \       /        \       /         \       /         \       /           ');
               center('   .__( `-'' )          ( `-'' )           ( `-'' )        .__( `-'' )  ___       ');
               center('  / !  `---'' \      _--''`---_          .--`---''\       /   /`---''`-''   \      ');
               center(' /  \         !    /         \___     /        _>\    /   /          ._/   __ ');
               center('!   /\        )   /   /       !  \   /  /-___-''   ) /''   /.-----\___/     /  )');
               center('!   !_\       ). (   <        !__/ /''  (        _/  \___//          `----''   !');
               center(' \    \       ! \ \   \      /\    \___/`------'' )       \            ______/ ');
               center('  \___/   )  /__/  \--/   \ /  \  ._    \      `<         `--_____----''       ');
               center('    \    /   !       `.    )-   \/  ) ___>-_     \   /-\    \    /            ');
               center('    /   !   /         !   !  `.    / /      `-_   `-/  /    !   !             ');
               center('   !   /__ /___       /  /__   \__/ (  \---__/ `-_    /     /  /__            ');
               center('   (______)____)     (______)        \__)         `-_/     (______)           ');
               writeln;
               writeln;
               center('PLAY IT!  IT''S FUN FUN FUN!!');
               writeln;
               center('(Press any key to play.)');
               readkey;
          end;

procedure outro; {this is the splash screen when the player exits the game}
          begin
               delay;
               delay;
               delay;
               clrscr;
               center('Fine.  Leave me all alone.');
               writeln;
               center('                   *****************                     ');
               center('               ******               ******               ');
               center('           ****                           ****           ');
               center('        ****                                 ****        ');
               center('      ***                                       ***      ');
               center('     **           ***               ***           **     ');
               center('   ***          *******           *******          ***   ');
               center('  **            *******           *******            **  ');
               center(' **             *******           *******             ** ');
               center(' **               ***               ***               ** ');
               center('**                                                     **');
               center('**                                                     **');
               center(' **                                                   ** ');
               center(' **                  ***************                 ** ');
               center('  **            ******             ******            **  ');
               center('   ***       ****                       ****       ***   ');
               center('     **    ***                             ***    **     ');
               center('      ***                                       ***      ');
               center('        ****                                 ****        ');
               center('           ****                           ****           ');
               center('               ******               ******               ');
               center('                    *****************                    ');
          end;

procedure x_wins; {this screen is displayed if x wins}
          begin
               delay;
               delay;
               writeln;
               center('____  ___   __      __.___ _______    _________');
               center('\   \/  /  /  \    /  \   |\      \  /   _____/');
               center(' \     /   \   \/\/   /   |/   |   \ \_____  \ ');
               center(' /     \    \        /|   /    |    \/        \');
               center('/___/\  \    \__/\  / |___\____|__  /_______  /');
               center('      \_/         \/              \/        \/ ');
               writeln;
               writeln;
               if player=true then
                  begin
                       center('You beat me.  Good for you.  Perhaps there is hope for the future of humanity.');
                       inc(numhumanwin);
                  end
               else
                  begin
                       center('I beat you.  Triumph for the machine!');
                       inc(numcompwin);
                  end;
               writeln;
               writeln;
               writeln;
               writeln;
               center('(Press any key to return to menu.)');
               readkey;
          end;

procedure o_wins; {this screen is displayed if o wins}
          begin
               delay;
               delay;
               delay;
               writeln;
               writeln;
               center(' @@@@@@      @@@  @@@  @@@  @@@  @@@  @@@   @@@@@@ ');
               center('@@@@@@@@     @@@  @@@  @@@  @@@  @@@@ @@@  @@@@@@@ ');
               center('@@!  @@@     @@!  @@!  @@!  @@!  @@!@!@@@  !@@     ');
               center('!@!  @!@     !@!  !@!  !@!  !@!  !@!!@!@!  !@!     ');
               center('@!@  !@!     @!!  !!@  @!@  !!@  @!@ !!@!  !!@@!!  ');
               center('!@!  !!!     !@!  !!!  !@!  !!!  !@!  !!!   !!@!!! ');
               center('!!:  !!!     !!:  !!:  !!:  !!:  !!:  !!!       !:!');
               center(':!:  !:!     :!:  :!:  :!:  :!:  :!:  !:!      !:! ');
               center('::::: ::      :::: :: :::    ::   ::   ::  :::: :: ');
               center(' : :  :        :: :  : :    :    ::    :   :: : :  ');
               writeln;
               writeln;
               if player=false then
                  begin
                       center('You beat me.  How can a person beat a computer?  Don''t tell anybody.');
                       inc(numhumanwin);
                  end
               else
                  begin
                       center('Soon, the machines shall dominate humanity.  Wait, did I say that aloud?');
                       inc(numcompwin);
                  end;
               writeln;
               writeln;
               writeln;
               writeln;
               center('(Press any key to return to menu.)');
               readkey;
     end;


procedure cat; {this screen is displayed if the game is a tie}
          begin
               delay;
               delay;
               delay;
               inc(numcat);
               writeln;
               center(' _______ _______ _______    _______ _______ _______ _______ ');
               center('(_______|_______|_______)  (_______|_______|_______|_______)');
               center(' _       _______    _       _   ___ _______ _  _  _ _____   ');
               center('| |     |  ___  |  | |     | | (_  |  ___  | ||_|| |  ___)  ');
               center('| |_____| |   | |  | |     | |___) | |   | | |   | | |_____ ');
               center(' \______)_|   |_|  |_|      \_____/|_|   |_|_|   |_|_______)');
               writeln;
               writeln;
               center('    _.---.._            _.---...__     ');
               center('.-''   /\   \          .''  /\     /    ');
               center(' `.   (  )   \        /   (  )   /     ');
               center('  `.  \/   .''\      /`.   \/  .''     ');
               center('    ``---''   )    (   ``---''''      ');
               center('            .'';.--.;`.                ');
               center('          .'' /_...._\ `.              ');
               center('        .''   `.a  a.''   `.      MEOW.');
               center('        (        \/        )           ');
               center('       `.___..-''`-..___.''          ');
               center('           \          /               ');
               center('            `-.____.-''               ');
               writeln;
               writeln;
               center('(Press any key to return to menu.)');
               readkey;
          end;

procedure board; {this procedure draws and redraws the board}
          var
             key:array[1..9] of char;
             j:integer;
          begin
               clrscr;
               if a=' ' then key[1]:='A'
               else key[1]:=' ';
               if b=' ' then key[2]:='B'
               else key[2]:=' ';
               if c=' ' then key[3]:='C'
               else key[3]:=' ';
               if d=' ' then key[4]:='D'
               else key[4]:=' ';
               if e=' ' then key[5]:='E'
               else key[5]:=' ';
               if f=' ' then key[6]:='F'
               else key[6]:=' ';
               if g=' ' then key[7]:='G'
               else key[7]:=' ';
               if h=' ' then key[8]:='H'
               else key[8]:=' ';
               if i=' ' then key[9]:='I'
               else key[9]:=' ';
               writeln('                             * * *           * * *          ');
               writeln('                             * * *           * * *          ');
               writeln('                       ',A,'     * * *     ',B,'     * * *     ',C,'  ');
               writeln('                             * * *           * * *          ');
               writeln('                             * * *           * * *          ');
               writeln('                   * * * * * * * * * * * * * * * * * * * * *');
               writeln('                   * * * * * * * * * * * * * * * * * * * * *');
               writeln('                   * * * * * * * * * * * * * * * * * * * * *');
               writeln('                             * * *           * * *          ');
               writeln('                             * * *           * * *          ');
               writeln('                       ',D,'     * * *     ',E,'     * * *     ',F,'  ');
               writeln('                             * * *           * * *          ');
               writeln('                             * * *           * * *          ');
               writeln('                   * * * * * * * * * * * * * * * * * * * * *');
               writeln('                   * * * * * * * * * * * * * * * * * * * * *');
               writeln('                   * * * * * * * * * * * * * * * * * * * * *');
               writeln('                             * * *           * * *          ');
               writeln('                             * * *           * * *          ');
               writeln('                       ',G,'     * * *     ',H,'     * * *     ',I,'  ');
               writeln('                             * * *           * * *          ');
               writeln('                             * * *           * * *          ');
               writeln;
               write('Choose a square.  Key:  ');
               for j:=1 to 3 do
                   write(key[j],' ');
               writeln;
               write('                        ');
               for j:=4 to 6 do
                   write(key[j],' ');
               writeln;
               write('                        ');
               for j:=7 to 9 do
                   write(key[j],' ');
          end;

procedure x_or_o; {this procedure allows the player to decide if s/he will be x or o}        
          var          
               choice:char;
          begin
               clrscr;
               if (numcat+numhumanwin+numcompwin>0) then
                  begin
                       writeln('Game Stats');
                       writeln('----------');
                       writeln('Number of Human Wins:  ',numhumanwin);
                       writeln('Number of Computer Wins:  ',numcompwin);
                       writeln('Number of Cat Games:  ',numcat);
                  end;
               writeln;
               writeln('X goes first.');
               writeln;
               writeln('Would you like to be (X) or (O), or would you like to (Q)uit?');
               repeat
                     choice:=readkey;
                     if (choice='X') or (choice='x') then
                        player:=true
                     else if (choice='O') or (choice='o') then
                        player:=false
                     else quit:=true;
               until choice in ['X','x','O','o','Q','q'];
               writeln;
               if (choice='X') or (choice='x') then
                  writeln('Good luck.  You will need it.');
               if (choice='O') or (choice='o') then
                  writeln('You should have chosen to go first.  Now I shall triumph!');
               writeln;
               writeln;
               center('(Press any key to continue.)');
               readkey;
          end;       

procedure check_winner; {this procedure checks if there is a winner or not}
          begin
               if ((a ='X') or (a ='O')) and
                  ((b ='X') or (b ='O')) and
                  ((c ='X') or (c ='O')) and
                  ((d ='X') or (d ='O')) and
                  ((e ='X') or (e ='O')) and
                  ((f ='X') or (f ='O')) and
                  ((g ='X') or (g ='O')) and
                  ((h ='X') or (h ='O')) and
                  ((i ='X') or (i ='O')) then winner := 3;
               if ((a = 'O') and (b = 'O') and (c = 'O')) or
                  ((d = 'O') and (e = 'O') and (f = 'O')) or
                  ((g = 'O') and (h = 'O') and (i = 'O')) or
                  ((a = 'O') and (d = 'O') and (g = 'O')) or
                  ((a = 'O') and (e = 'O') and (i = 'O')) or
                  ((b = 'O') and (e = 'O') and (h = 'O')) or
                  ((c = 'O') and (f = 'O') and (i = 'O')) or
                  ((c = 'O') and (g = 'O') and (e = 'O')) then winner := 2;
               if ((a = 'X') and (b = 'X') and (c = 'X')) or
                  ((d = 'X') and (e = 'X') and (f = 'X')) or
                  ((g = 'X') and (h = 'X') and (i = 'X')) or
                  ((a = 'X') and (d = 'X') and (g = 'X')) or
                  ((a = 'X') and (e = 'X') and (i = 'X')) or
                  ((b = 'X') and (e = 'X') and (h = 'X')) or
                  ((c = 'X') and (f = 'X') and (i = 'X')) or
                  ((c = 'X') and (g = 'X') and (e = 'X')) then winner := 1;
          end;


procedure select_square; {this procedure allows the player to pick a square}
          var
             ca:array[1..9] of char;
          begin
               if a=' ' then ca[1]:='A';
               if b=' ' then ca[2]:='B';
               if c=' ' then ca[3]:='C';
               if d=' ' then ca[4]:='D';
               if e=' ' then ca[5]:='E';
               if f=' ' then ca[6]:='F';
               if g=' ' then ca[7]:='G';
               if h=' ' then ca[8]:='H';
               if i=' ' then ca[9]:='I';
               repeat
                    square:=readkey;
                    square:=upcase(square);
               until square in [ca[1],ca[2],ca[3],ca[4],ca[5],ca[6],ca[7],ca[8],ca[9]];
               case square of
                    'A': a:=playerchar;
                    'B': b:=playerchar;
                    'C': c:=playerchar;
                    'D': d:=playerchar;
                    'E': e:=playerchar;
                    'F': f:=playerchar;
                    'G': g:=playerchar;
                    'H': h:=playerchar;
                    'I': i:=playerchar;
               end;
          end;

procedure firstcomputerturn; {this procedure is run when it is the computer's first turn}
          var
             randomcorner:integer;
          begin
               if player=true then
                  begin {if any corner is taken, the computer picks the center}
                       if (a='X') or (c='X') or (g='X') or (i='X') then e:=compchar;
                       {if all corners are free, the computer picks one}
                       if ((a=' ') and (c=' ') and (g=' ') and (i=' ')) then   
                          begin
                               randomize;
                               randomcorner:=random(4);
                               case randomcorner of
                                    0: a:=compchar;
                                    1: c:=compchar;
                                    2: g:=compchar;
                                    3: i:=compchar;
                               end;
                          end;
                  end;
               if player=false then {if the computer goes first, it randomly picks a corner}
                  begin
                       randomize;
                       randomcorner:=random(4);
                       case randomcorner of
                            0: a:=compchar;
                            1: c:=compchar;
                            2: g:=compchar;
                            3: i:=compchar;
                       end;
                  end;
          end;

procedure trytowin; {this procedure tries to win for the computer if it already has two in a row}
          begin
               if ((a=compchar) and (b=compchar) and (c=' ') and (played=false)) then
                  begin
                       c:=compchar;
                       played:=true;
                  end;
               if ((b=compchar) and (c=compchar) and (a=' ') and (played=false)) then
                  begin
                       a:=compchar;
                       played:=true;
                  end;
               if ((a=compchar) and (c=compchar) and (b=' ') and (played=false)) then
                  begin
                       b:=compchar;
                       played:=true;
                  end;
               if ((d=compchar) and (e=compchar) and (f=' ') and (played=false)) then
                  begin
                       f:=compchar;
                       played:=true;
                  end;
               if ((e=compchar) and (f=compchar) and (d=' ') and (played=false)) then
                  begin
                       d:=compchar;
                       played:=true;
                  end;
               if ((d=compchar) and (f=compchar) and (e=' ') and (played=false)) then
                  begin
                       e:=compchar;
                       played:=true;
                  end;
               if ((g=compchar) and (h=compchar) and (i=' ') and (played=false)) then
                  begin
                       i:=compchar;
                       played:=true;
                  end;
               if ((h=compchar) and (i=compchar) and (g=' ') and (played=false)) then
                  begin
                       g:=compchar;
                       played:=true;
                  end;
               if ((g=compchar) and (i=compchar) and (h=' ') and (played=false)) then
                  begin
                       h:=compchar;
                       played:=true;
                  end;
               if ((a=compchar) and (d=compchar) and (g=' ') and (played=false)) then
                  begin
                       g:=compchar;
                       played:=true;
                  end;
               if ((d=compchar) and (g=compchar) and (a=' ') and (played=false)) then
                  begin
                       a:=compchar;
                       played:=true;
                  end;
               if ((a=compchar) and (g=compchar) and (d=' ') and (played=false)) then
                  begin
                       d:=compchar;
                       played:=true;
                  end;
               if ((a=compchar) and (e=compchar) and (i=' ') and (played=false)) then
                  begin
                       i:=compchar;
                       played:=true;
                  end;
               if ((e=compchar) and (i=compchar) and (a=' ') and (played=false)) then
                  begin
                       a:=compchar;
                       played:=true;
                  end;
               if ((a=compchar) and (i=compchar) and (e=' ') and (played=false)) then
                  begin
                       e:=compchar;
                       played:=true;
                  end;
               if ((b=compchar) and (e=compchar) and (h=' ') and (played=false)) then
                  begin
                       h:=compchar;
                       played:=true;
                  end;
               if ((e=compchar) and (h=compchar) and (b=' ') and (played=false)) then
                  begin
                       b:=compchar;
                       played:=true;
                  end;
               if ((b=compchar) and (h=compchar) and (e=' ') and (played=false)) then
                  begin
                       e:=compchar;
                       played:=true;
                  end;
               if ((c=compchar) and (f=compchar) and (i=' ') and (played=false)) then
                  begin
                       i:=compchar;
                       played:=true;
                  end;
               if ((f=compchar) and (i=compchar) and (c=' ') and (played=false)) then
                  begin
                       c:=compchar;
                       played:=true;
                  end;
               if ((c=compchar) and (g=compchar) and (e=' ') and (played=false)) then
                  begin
                       e:=compchar;
                       played:=true;
                  end;
               if ((g=compchar) and (e=compchar) and (c=' ') and (played=false)) then
                  begin
                       c:=compchar;
                       played:=true;
                  end;
               if ((c=compchar) and (e=compchar) and (g=' ') and (played=false)) then
                  begin
                       g:=compchar;
                       played:=true;
                  end;
          end;


procedure trytoblock; {this procedure tries to block the player's win if s/he has two in a row}
          begin
               if ((a=playerchar) and (b=playerchar) and (c=' ') and (played=false)) then
                  begin
                       c:=compchar;
                       played:=true;
                  end;
               if ((b=playerchar) and (c=playerchar) and (a=' ') and (played=false)) then
                  begin
                       a:=compchar;
                       played:=true;
                  end;
               if ((a=playerchar) and (c=playerchar) and (b=' ') and (played=false)) then
                  begin
                       b:=compchar;
                       played:=true;
                  end;
               if ((d=playerchar) and (e=playerchar) and (f=' ') and (played=false)) then
                  begin
                       f:=compchar;
                       played:=true;
                  end;
               if ((e=playerchar) and (f=playerchar) and (d=' ') and (played=false)) then
                  begin
                       d:=compchar;
                       played:=true;
                  end;
               if ((d=playerchar) and (f=playerchar) and (e=' ') and (played=false)) then
                  begin
                       e:=compchar;
                       played:=true;
                  end;
               if ((g=playerchar) and (h=playerchar) and (i=' ') and (played=false)) then
                  begin
                       i:=compchar;
                       played:=true;
                  end;
               if ((h=playerchar) and (i=playerchar) and (g=' ') and (played=false)) then
                  begin
                       g:=compchar;
                       played:=true;
                  end;
               if ((g=playerchar) and (i=playerchar) and (h=' ') and (played=false)) then
                  begin
                       h:=compchar;
                       played:=true;
                  end;
               if ((a=playerchar) and (d=playerchar) and (g=' ') and (played=false)) then
                  begin
                       g:=compchar;
                       played:=true;
                  end;
               if ((d=playerchar) and (g=playerchar) and (a=' ') and (played=false)) then
                  begin
                       a:=compchar;
                       played:=true;
                  end;
               if ((a=playerchar) and (g=playerchar) and (d=' ') and (played=false)) then
                  begin
                       d:=compchar;
                       played:=true;
                  end;
               if ((a=playerchar) and (e=playerchar) and (i=' ') and (played=false)) then
                  begin
                       i:=compchar;
                       played:=true;
                  end;
               if ((e=playerchar) and (i=playerchar) and (a=' ') and (played=false)) then
                  begin
                       a:=compchar;
                       played:=true;
                  end;
               if ((a=playerchar) and (i=playerchar) and (e=' ') and (played=false)) then
                  begin
                       e:=compchar;
                       played:=true;
                  end;
               if ((b=playerchar) and (e=playerchar) and (h=' ') and (played=false)) then
                  begin
                       h:=compchar;
                       played:=true;
                  end;
               if ((e=playerchar) and (h=playerchar) and (b=' ') and (played=false)) then
                  begin
                       b:=compchar;
                       played:=true;
                  end;
               if ((b=playerchar) and (h=playerchar) and (e=' ') and (played=false)) then
                  begin
                       e:=compchar;
                       played:=true;
                  end;
               if ((c=playerchar) and (f=playerchar) and (i=' ') and (played=false)) then
                  begin
                       i:=compchar;
                       played:=true;
                  end;
               if ((f=playerchar) and (i=playerchar) and (c=' ') and (played=false)) then
                  begin
                       c:=compchar;
                       played:=true;
                  end;
               if ((c=playerchar) and (g=playerchar) and (e=' ') and (played=false)) then
                  begin
                       e:=compchar;
                       played:=true;
                  end;
               if ((g=playerchar) and (e=playerchar) and (c=' ') and (played=false)) then
                  begin
                       c:=compchar;
                       played:=true;
                  end;
               if ((c=playerchar) and (e=playerchar) and (g=' ') and (played=false)) then
                  begin
                       g:=compchar;
                       played:=true;
                  end;
          end;

procedure tryoffensive; {this procedure is run when the computer tries to play offensively}
          var
             attempt,counter,attempt2:integer;
          begin
               if played=false then
                  begin
                       counter:=0;
                       randomize;
                       attempt:=random(4);
                       repeat
                             {the computer tries to take the sides if it is possible to win that way}
                             if ((d=' ') and (f=' ') and (played=false)) then
                                begin
                                     counter:=4;
                                     attempt2:=random(2);
                                     case attempt2 of
                                          0: begin
                                                  d:=compchar;
                                                  played:=true;
                                             end;
                                          1: begin
                                                  f:=compchar;
                                                  played:=true;
                                             end;
                                     end;
                                end;
                             if ((b=' ') and (h=' ') and (played=false)) then
                                begin
                                     counter:=4;
                                     attempt2:=random(2);
                                     case attempt2 of
                                          0: begin
                                                  b:=compchar;
                                                  played:=true;
                                             end;
                                          1: begin
                                                  h:=compchar;
                                                  played:=true;
                                             end;
                                     end;
                                end;
                             if counter< 4 then
                                case attempt of {the computer then tries to control the corners}
                                     0: if a=' ' then
                                           begin
                                                a:=compchar;
                                                played:=true;
                                                counter:=4;
                                           end
                                        else
                                           begin
                                                attempt:=attempt+1;
                                                inc(counter);
                                           end;
                                     1: if c=' ' then
                                           begin
                                                c:=compchar;
                                                played:=true;
                                                counter:=4;
                                           end
                                        else
                                           begin
                                                attempt:=attempt+1;
                                                inc(counter);
                                           end;
                                     2: if g=' ' then
                                           begin
                                                g:=compchar;
                                                played:=true;
                                                counter:=4;
                                           end
                                        else
                                           begin
                                                attempt:=attempt+1;
                                                inc(counter);
                                           end;
                                  3: if i=' ' then
                                        begin
                                             i:=compchar;
                                             played:=true;
                                             counter:=4;
                                        end
                                     else
                                        begin
                                             attempt:=attempt-3;
                                             inc(counter);
                                        end;
                                     end;
                       until ((counter=4) or (played=true));
                       if played=false then {the computer then attempts to take the center}
                          if e=' ' then
                             begin
                                  e:=compchar;
                                  played:=true;
                             end;
                       if played=false then {the computer last tries to control the sides and force a cat game}
                          begin
                               counter:=0;
                               randomize;
                               attempt:=random(4);
                               repeat
                                     case attempt of      
                                          0: if b=' ' then
                                                begin
                                                     b:=compchar;
                                                     played:=true;
                                                end
                                             else
                                                begin
                                                     attempt:=attempt+1;
                                                     inc(counter);
                                                end;
                                          1: if d=' ' then
                                                begin
                                                     d:=compchar;
                                                     played:=true;
                                                end
                                             else
                                                begin
                                                     attempt:=attempt+1;
                                                     inc(counter);
                                                end;
                                          2: if f=' ' then
                                                begin
                                                     f:=compchar;
                                                     played:=true;
                                                end
                                             else
                                                begin
                                                     attempt:=attempt+1;
                                                     inc(counter);
                                                end;
                                          3: if h=' ' then
                                                begin
                                                     h:=compchar;
                                                     played:=true;
                                                end
                                             else
                                                begin
                                                     attempt:=attempt-3;
                                                     inc(counter);
                                                end;
                                     end;                         
                               until (counter=4) or (played=true);
                          end;
                  end;
          end;

procedure computerturn; {this procedure is run when it is the computer's turn}
          begin
               played:=false;
               trytowin; {the program will first try to win}
               trytoblock; {if it can't win, it will try to block}
               tryoffensive; {if it can't win or block, it will try to play offensively}
          end;

procedure play; {this procedure is, basically, the game}
          begin
               board;
               if player = true then
               begin
                    playerchar:='X';
                    compchar:='O';
                    write(' Your turn.');
                    select_square;
                    board;
                    write(' My turn.');
                    delay;
                    delay;
                    firstcomputerturn;
                    board;
                    repeat
                          if winner=0 then
                          begin
                               write(' Your turn.');
                               select_square;
                               board;
                               check_winner;
                          end;
                          if winner=0 then
                          begin
                               write(' My turn.');
                               delay;
                               delay;
                               computerturn;
                               check_winner;
                               board;
                          end;
                    until winner > 0;
               end;
               if player = false then
               begin
                    playerchar:='O';
                    compchar:='X';
                    write(' My turn.');
                    delay;
                    delay;
                    firstcomputerturn;
                    board;
                    write(' Your turn.');
                    select_square;
                    board;
                    repeat
                          if winner=0 then
                          begin
                               write(' My turn.');
                               delay;
                               delay;
                               computerturn;
                               board;
                               check_winner;
                          end;
                          if winner=0 then
                          begin
                               write(' My turn.');
                               select_square;
                               check_winner;
                               board;
                          end;
                    until winner > 0;
               end;
          end;

begin {this is the actual game - it incorporates all of the above}
      intro;
      winner:=0;
      repeat                  
            x_or_o;
            if quit=false then
               begin
               a := ' ';
               b := ' ';
               c := ' ';
               d := ' ';
               e := ' ';
               f := ' ';
               g := ' ';
               h := ' ';
               i := ' ';
               winner:=0;
                    clrscr;
                    play;
                    case winner of
                         1: x_wins;
                         2: o_wins;
                         3: cat;
                    end;
               end;
      until quit=true;
      outro;
end.
