var stations=[
  ["Jurong East",1.333207,103.742308],
  ["Bukit Batok",1.349069,103.749596],
  ["Bukit Gombak",1.359043,103.751863],
  ["Choa Chu Kang",1.385417,103.744316],
  ["Yew Tee",1.397383,103.747523],
  ["Kranji",1.425302,103.762049],
  ["Marsiling",1.432579,103.77415],
  ["Woodlands",1.436984,103.786406],
  ["Admiralty",1.436984,103.786406],
  ["Sembawang",1.449133,103.82006],
  ["Yishun",1.429666,103.835044],
  ["Khatib",1.417423,103.832995],
  ["Yio Chu Kang",1.381765,103.844923],
  ["Ang Mo Kio",1.370025,103.849588],
  ["Bishan",1.35092,103.848206],
  ["Braddell",1.34055,103.847098],
  ["Toa Payoh",1.332405,103.847436],
  ["Novena",1.320089,103.843405],
  ["Newton",1.31383,103.838021],
  ["Orchard",1.304041,103.831792],
  ["Somerset",1.300508,103.838428],
  ["Dhoby Ghaut",1.299169,103.845799],
  ["City Hall",1.293119,103.852089],
  ["Raffles Place",1.284001,103.85155],
  ["Marina Bay",1.276481,103.854598],
  ["Marina South Pier",1.271422,103.863581],
  ["Tuas Link",1.340371,103.636866],
  ["Tuas West Road",1.330075,103.639636],
  ["Tuas Crescent",1.321091,103.649075],
  ["Gul Circle",1.319809,103.66083],
  ["Joo Koon",1.327826,103.678318],
  ["Pioneer",1.337645,103.69742],
  ["Boon Lay",1.33862,103.705817],
  ["Lakeside",1.344264,103.720797],
  ["Chinese Garden",1.342436,103.732582],
  ["Clementi",1.314925,103.765341],
  ["Dover",1.311414,103.778596],
  ["Buona Vista",1.307337,103.790046],
  ["Commonwealth",1.302439,103.798326],
  ["Queenstown",1.294867,103.805902],
  ["Redhill",1.289674,103.816787],
  ["Tiong Bahru",1.286555,103.826956],
  ["Outram Park",1.280319,103.839459],
  ["Tanjong Pagar",1.276385,103.846771],
  ["Bugis",1.300747,103.855873],
  ["Lavender",1.307577,103.863155],
  ["Kallang",1.311532,103.871372],
  ["Aljunied",1.316474,103.882762],
  ["Paya Lebar",1.318214,103.893133],
  ["Eunos",1.319809,103.902888],
  ["Kembangan",1.320998,103.913433],
  ["Bedok",1.324043,103.930205],
  ["Tanah Merah",1.327309,103.946479],
  ["Simei",1.343237,103.953343],
  ["Tampines",1.354467,103.943325],
  ["Pasir Ris",1.373234,103.949343],
  ["Expo",1.334479,103.961459],
  ["Changi Airport",1.357622,103.988487],
  ["HarbourFront",1.265453,103.820514],
  ["Chinatown",1.284566,103.843626],
  ["Clarke Quay",1.288949,103.847521],
  ["Little India",1.306691,103.849396],
  ["Farrer Park",1.312679,103.854872],
  ["Boon Keng",1.320091,103.861655],
  ["Potong Pasir",1.331316,103.868779],
  ["Woodleigh",1.339202,103.870727],
  ["Serangoon",1.349862,103.873635],
  ["Kovan",1.360207,103.885163],
  ["Hougang",1.371406,103.892533],
  ["Buangkok",1.382991,103.893347],
  ["Sengkang",1.391682,103.895475],
  ["Punggol",1.405191,103.902367],
  ["Bras Basah",1.296978,103.850715],
  ["Esplanade",1.293995,103.855396],
  ["Promenade",1.294063,103.860156],
  ["Nicoll Highway",1.300292,103.863449],
  ["Stadium",1.302847,103.875417],
  ["Mountbatten",1.306106,103.883175],
  ["Dakota",1.308474,103.888825],
  ["MacPherson",1.326769,103.889901],
  ["Tai Seng",1.33594,103.887706],
  ["Bartley",1.342923,103.87966],
  ["Lorong Chuan",1.35153,103.864957],
  ["Marymount",1.349089,103.839116],
  ["Caldecott",1.337649,103.839627],
  ["Botanic Gardens",1.322387,103.814905],
  ["Farrer Road",1.317606,103.807711],
  ["Holland Village",1.311189,103.796119],
  ["one-north",1.299854,103.787584],
  ["Kent Ridge",1.293629,103.784441],
  ["Haw Par Villa",1.283149,103.781991],
  ["Pasir Panjang",1.276111,103.791893],
  ["Labrador Park",1.27218,103.802557],
  ["Telok Blangah",1.270769,103.809878],
  ["Bayfront",1.281371,103.858998],
  ["Bukit Panjang",1.37834,103.762452],
  ["Cashew",1.369997,103.764569],
  ["Hillview",1.363185,103.767371],
  ["Beauty World",1.341607,103.775682],
  ["King Albert Park",1.335721,103.783203],
  ["Sixth Avenue",1.331221,103.79718],
  ["Tan Kah Kee",1.325826,103.807959],
  ["Stevens",1.320012,103.825964],
  ["Rochor",1.303601,103.852581],
  ["Downtown",1.27949,103.852802],
  ["Telok Ayer",1.282285,103.848584],
  ["Fort Canning",1.291631,103.844621],
  ["Bencoolen",1.298477,103.849984],
  ["Jalan Besar",1.305551,103.855443],
  ["Bendemeer",1.313674,103.863098],
  ["Geylang Bahru",1.321479,103.871457],
  ["Mattar",1.326878,103.883304],
  ["Ubi",1.330008,103.898911],
  ["Kaki Bukit",1.335076,103.909057],
  ["Bedok North",1.335268,103.918054],
  ["Bedok Reservoir",1.336595,103.93307],
  ["Tampines West",1.345583,103.938244],
  ["Tampines East",1.35631,103.955471],
  ["Upper Changi",1.342218,103.961505],
  ["South View",1.380299,103.745286],
  ["Keat Hong",1.378604,103.749058],
  ["Teck Whye",1.376738,103.753665],
  ["Phoenix",1.378798,103.758021],
  ["Senja",1.382852,103.762312],
  ["Jelapang",1.386703,103.764547],
  ["Segar",1.387713,103.769599],
  ["Fajar",1.384502,103.770862],
  ["Bangkit",1.380281,103.772576],
  ["Pending",1.376223,103.771277],
  ["Petir",1.377828,103.76655],
  ["Compassvale",1.394615,103.900443],
  ["Rumbia",1.391553,103.905947],
  ["Bakau",1.38804,103.905412],
  ["Kangkar",1.383957,103.90216],
  ["Ranggung",1.384116,103.897386],
  ["Cheng Lim",1.396332,103.89379],
  ["Farmway",1.397178,103.889168],
  ["Kupang",1.398271,103.881283],
  ["Thanggam",1.397378,103.87561],
  ["Fernvale",1.392033,103.876256],
  ["Layar",1.392141,103.880022],
  ["Tongkang",1.389519,103.885829],
  ["Renjong",1.386827,103.890541],
  ["Cove",1.399534,103.905792],
  ["Meridian",1.397002,103.908884],
  ["Coral Edge",1.39392,103.912633],
  ["Riviera",1.39454,103.916056],
  ["Kadaloor",1.399633,103.916536],
  ["Oasis",1.402304,103.912736],
  ["Damai",1.405293,103.908606],
  ["Sam Kee",1.409808,103.90492],
  ["Teck Lee",1.412783,103.906565],
  ["Punggol Point",1.416932,103.90668],
  ["Samudera",1.415955,103.902185],
  ["Nibong",1.411865,103.900321],
  ["Sumang",1.408501,103.898605],
  ["Soo Teck",1.405436,103.897287],


];