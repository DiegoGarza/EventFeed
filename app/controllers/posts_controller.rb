class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.score = 0
    event = Event.find(post_params[:event_id])
    if event.posts.count == 0 && event.user_id
      UserMailer.event_start(event, event.user).deliver
    end
    #Animal array
    animals = ["Aardvark","Albatross","Alligator","Alpaca","Ant","Anteater","Antelope","Ape","Armadillo","Ass","Donkey","Baboon","Badger","Barracuda","Bat","Bear","Beaver","Bee","Bison","Boar","Buffalo","Galago","Butterfly","Camel","Caribou","Cat","Caterpillar","Cattle","Chamois","Cheetah","Chicken","Chimpanzee","Chinchilla","Chough","Clam","Cobra","Cockroach","Cod","Cormorant","Coyote","Crab","Crane","Crocodile","Crow","Curlew","Deer","Dinosaur","Dog","Dogfish","Dolphin","Donkey","Dotterel","Dove","Dragonfly","Duck","Dugong","Dunlin","Eagle","Echidna","Eel","Eland","Elephant","Elephant seal","Elk","Emu","Falcon","Ferret","Finch","Fish","Flamingo","Fly","Fox","Frog","Gaur","Gazelle","Gerbil","Giant Panda","Giraffe","Gnat","Gnu","Goat","Goose","Goldfinch","Goldfish","Gorilla","Goshawk","Grasshopper","Grouse","Guanaco","Guinea fowl","Guinea pig","Gull","Hamster","Hare","Hawk","Hedgehog","Heron","Herring","Hippopotamus","Hornet","Horse","Human","Hummingbird","Hyena","Jackal","Jaguar","Jay","Jay, Blue","Jellyfish","Kangaroo","Koala","Komodo dragon","Kouprey","Kudu","Lapwing","Lark","Lemur","Leopard","Lion","Llama","Lobster","Locust","Loris","Louse","Lyrebird","Magpie","Mallard","Manatee","Marten","Meerkat","Mink","Mole","Monkey","Moose","Mouse","Mosquito","Mule","Narwhal","Newt","Nightingale","Octopus","Okapi","Opossum","Oryx","Ostrich","Otter","Owl","Ox","Oyster","Panther","Parrot","Partridge","Peafowl","Pelican","Penguin","Pheasant","Pig","Pigeon","Pony","Porcupine","Porpoise","Prairie Dog","Quail","Quelea","Rabbit","Raccoon","Rail","Ram","Rat","Raven","Red deer","Red panda","Reindeer","Rhinoceros","Rook","Ruff","Salamander","Salmon","Sand Dollar","Sandpiper","Sardine","Scorpion","Sea lion","Sea Urchin","Seahorse","Seal","Shark","Sheep","Shrew","Shrimp","Skunk","Snail","Snake","Spider","Squid","Squirrel","Starling","Stingray","Stinkbug","Stork","Swallow","Swan","Tapir","Tarsier","Termite","Tiger","Toad","Trout","Turkey","Turtle","Vicuña","Viper","Vulture","Wallaby","Walrus","Wasp","Water buffalo","Weasel","Whale","Wolf","Wolverine","Wombat","Woodcock","Woodpecker","Worm","Wren","Yak","Zebra"]
    adjective = ["adorable","adventurous","aggressive","agreeable","alert","alive","amused","angry","annoyed","annoying","anxious","arrogant","ashamed","attractive","average","awful","bad","beautiful","better","bewildered","black","bloody","blue","blue-eyed","blushing","bored","brainy","brave","breakable","bright","busy","calm","careful","cautious","charming","cheerful","clean","clear","clever","cloudy","clumsy","colorful","combative","comfortable","concerned","condemned","confused","cooperative","courageous","crazy","creepy","crowded","cruel","curious","cute","dangerous","dark","dead","defeated","defiant","delightful","depressed","determined","different","difficult","disgusted","distinct","disturbed","dizzy","doubtful","drab","dull","eager","easy","elated","elegant","embarrassed","enchanting","encouraging","energetic","enthusiastic","envious","evil","excited","expensive","exuberant","fair","faithful","famous","fancy","fantastic","fierce","filthy","fine","foolish","fragile","frail","frantic","friendly","frightened","funny","gentle","gifted","glamorous","gleaming","glorious","good","gorgeous","graceful","grieving","grotesque","grumpy","handsome","happy","healthy","helpful","helpless","hilarious","homeless","homely","horrible","hungry","hurt","ill","important","impossible","inexpensive","innocent","inquisitive","itchy","jealous","jittery","jolly","joyous","kind","lazy","light","lively","lonely","long","lovely","lucky","magnificent","misty","modern","motionless","muddy","mushy","mysterious","nasty","naughty","nervous","nice","nutty","obedient","obnoxious","odd","old fashioned","open","outrageous","outstanding","panicky","perfect","plain","pleasant","poised","poor","powerful","precious","prickly","proud","puzzled","quaint","real","relieved","repulsive","rich","scary","selfish","shiny","shy","silly","sleepy","smiling","smoggy","sore","sparkling","splendid","spotless","stormy","strange","stupid","successful","super","talented","tame","tender","tense","terrible","testy","thankful","thoughtful","thoughtless","tired","tough","troubled","ugliest","ugly","uninterested","unsightly","unusual","upset","uptight","vast","victorious","vivacious","wandering","weary","wicked","wide eyed","wild","witty","worrisome","worried","wrong","zany","zealous"]
    @post.name = adjective[rand(0..adjective.count-1)] + " " + animals[rand(0..animals.count-1)]
    if @post.save
      flash[:success] = "Post created!"
      redirect_to find_path(event.name)
    else
      redirect_to find_path(event.name)
    end
  end

  def upvote
    @post = Post.find(params[:id])
    @post.score = @post.score+1
    @post.save
    redirect_to find_path(@post.event.name)
  end

  private

    def post_params
      params.require(:post).permit(:comment, :event_id, :user_id)
    end
end
