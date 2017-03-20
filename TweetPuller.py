#Script that pulls 967 tweets from @BlueJaysUMP for the use of analysis. This information includes all the notable pitches from 2016

import tweepy
import csv

#In order for this to work you must provide your own account information
#You can retrieve this info from your Twitter API developer profile
#Twitter API credentials
consumer_key = ""
consumer_secret = ""
access_key = ""
access_secret = ""

def get_all_tweets(user_name):
    auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
    auth.set_access_token(access_key, access_secret)
    api = tweepy.API(auth)

    alltweets = []

    new_tweets = api.user_timeline(screen_name = user_name,count=200)

    alltweets.extend(new_tweets)

    old = alltweets[-1].id - 1

    #967 is the last tweet of 2016
    while len(new_tweets) > 0 and len(alltweets) < 950:
        new_tweets = api.user_timeline(screen_name=user_name, count=50, max_id=old)
        alltweets.extend(new_tweets)
        old = alltweets[-1].id - 1

    new_tweets = api.user_timeline(screen_name=user_name, count=17, max_id=old)
    alltweets.extend(new_tweets)

    #parses the data and calls tweetParser
    for i in range(len(alltweets)):
        alltweets[i] = tweetParser(str(alltweets[i].text.encode("utf-8")).replace('\\n', ' ').replace('Jr.', '').split())

    #output as csv file
    with open('databaseball.csv', 'w', newline='') as myfile:
        writer = csv.writer(myfile)
        writer.writerows(alltweets)

    pass

    print("Success. CSV created of all 2016 tweeets.")

def tweetParser(allTweets):
    initTweets = []
    favor = ''
    umpCall = ''
    strikeZoneCall = ''
    playerList = []
    bluejaysPlayer = ''
    percentSame = ''
    distance = ''
    parsedTweets = []

    initTweets = allTweets

    if (initTweets[1] == "helps"):
        favor = "helps"
    elif (initTweets[1] == "hurts"):
        favor = "hurts"

    if (initTweets[3] == "Strike"):
        umpCall = "strike"
    elif (initTweets[3] == "Ball"):
        umpCall = "ball"

    if (initTweets[7] == "ball"):
        strikeZoneCall = "ball"
    elif (initTweets[7] == "strike"):
        strikeZoneCall = "strike"

    playerList = createPlayerList()
    for c in range(len(playerList)):
        if (initTweets[11] == playerList[c]):
            bluejaysPlayer = initTweets[11]
        if (initTweets[13] == playerList[c]):
            bluejaysPlayer = initTweets[13]

    percentSame = initTweets[14].replace('%', '')

    distance = initTweets[17].replace('in', '')

    initTweets = [favor, umpCall, strikeZoneCall,bluejaysPlayer, percentSame, distance]

    return(initTweets)

#list of players from bluejays 2016
def createPlayerList():
    players = []
    players.append("Antolin")
    players.append("Barnes")
    players.append("Barney")
    players.append("Bautista")
    players.append("Benoit")
    players.append("Biagini")
    players.append("Burns")
    players.append("Carrera")
    players.append("Cecil")
    players.append("Ceciliani")
    players.append("Chavez")
    players.append("Colabello")
    players.append("Dermody")
    players.append("Diamond")
    players.append("Dickey")
    players.append("Dominguez")
    players.append("Donaldson")
    players.append("Encarnacion")
    players.append("Estrada")
    players.append("Feldman")
    players.append("Floyd")
    players.append("Girodo")
    players.append("Goins")
    players.append("Grilli")
    players.append("Happ")
    players.append("Hutchison")
    players.append("Lake")
    players.append("Leon")
    players.append("Liriano")
    players.append("Loup")
    players.append("Martin")
    players.append("Morales")
    players.append("Navarro")
    players.append("Osuna")
    players.append("Paredes")
    players.append("Pillar")
    players.append("Pompey")
    players.append("Sanchez")
    players.append("Saunders")
    players.append("Schultz")
    players.append("Smoak")
    players.append("Storen")
    players.append("Stroman")
    players.append("Tepera")
    players.append("Thole")
    players.append("Travis")
    players.append("Tulowitzki")
    players.append("Upton")
    players.append("Venditte")

    return (players)

if __name__ == '__main__':
    get_all_tweets("BlueJaysUmp")
