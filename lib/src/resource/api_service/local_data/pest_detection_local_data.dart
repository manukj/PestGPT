import 'package:pest_gpt/src/models/pest/pest_info.dart';

Map<String,dynamic> _pestDetectionLocalData = {
  "INSECTA": {
    "pest_info":
        "Insecta is a class of pests that includes various species affecting a wide range of plants, including vegetables, fruits, and ornaments. These pests are known for causing damage through feeding on plant tissues, spreading diseases, and affecting plant growth. Historically, insects have had significant impacts on agriculture, leading to the development of integrated pest management practices. They can result in yield losses and reduced quality of produce, making understanding and managing these pests crucial for farmers and gardeners.",
    "ideal_temperature": {"min": 20.0, "max": 30.0},
    "ideal_humidity": {"min": 50.0, "max": 70.0},
    "ideal_wind": {"min": 0.0, "max": 5.0},
    "precautions": [
      "Regularly inspect plants for signs of infestation.",
      "Maintain healthy soil and plant practices.",
      "Use row covers to protect young plants.",
      "Encourage natural predators in the garden."
    ],
    "pesticides": [
      {"name": "Pyrethrin", "cost": "500"},
      {"name": "Neem Oil", "cost": "300"},
      {"name": "Insecticidal Soap", "cost": "250"}
    ]
  },
  "GRAIN APHID (SITOBION AVENAE) or ROSE GRAIN APHID": {
    "pest_info":
        "The Grain Aphid (Sitobion avenae), also known as the Rose Grain Aphid, primarily affects cereal crops, including wheat, barley, and oats, as well as several other plants such as corn and a variety of ornamental flowers. It is native to Europe but has spread globally, often thriving in temperate regions. Infestations can lead to significant yield losses, as these aphids feed on plant sap, weakening plants and potentially transmitting viral diseases.",
    "ideal_temperature": {"min": 15.0, "max": 30.0},
    "ideal_humidity": {"min": 40.0, "max": 80.0},
    "ideal_wind": {"min": 0.0, "max": 5.0},
    "precautions": [
      "Monitor plants regularly for early signs of infestations.",
      "Encourage natural predators, such as ladybugs and lacewings.",
      "Rotate crops to reduce populations in infested areas."
    ],
    "pesticides": [
      {"name": "Insecticidal Soap", "cost": "500"},
      {"name": "Neem Oil", "cost": "300"},
      {"name": "Pyrethrin", "cost": "450"}
    ]
  },
  "POLLEN BEETLE (MELIGETHES SPP.)": {
    "pest_info":
        "Pollen Beetles (Meligethes spp.) are small beetles commonly found in agricultural areas, particularly affecting cruciferous crops such as rapeseed and mustard. They are known for their feeding habits, which can lead to significant economic loss due to reduced seed production. Historically, these beetles have been a pest in Europe and North America since the early 20th century, often thriving in warmer climates during the spring and early summer months. Their presence is often an indicator of a larger pest management issue.",
    "ideal_temperature": {"min": 18.0, "max": 25.0},
    "ideal_humidity": {"min": 40.0, "max": 70.0},
    "ideal_wind": {"min": 0.0, "max": 5.0},
    "precautions": [
      "Monitor crops regularly for early signs of infestation.",
      "Implement crop rotation to disrupt beetle life cycles.",
      "Use physical barriers, like row covers, to protect young plants."
    ],
    "pesticides": [
      {"name": "Pyrethroid Insecticides", "cost": "500"},
      {"name": "Neonicotinoids", "cost": "700"},
      {"name": "Insecticidal Soaps", "cost": "300"}
    ]
  },
  "SNAIL": {
    "pest_info":
        "Snails are common garden pests that primarily feed on tender leaves, fruits, and seedlings. They thrive in moist environments and can be particularly damaging to plants like lettuce, basil, and hostas. Historically, snails have been pests for centuries, with populations persisting in various climates around the world, attributed to their ability to adapt to different environmental conditions. Their gelatinous bodies make them susceptible to dehydration, leading them to seek out damp habitats.",
    "ideal_temperature": {"min": 15.0, "max": 25.0},
    "ideal_humidity": {"min": 70.0, "max": 90.0},
    "ideal_wind": {"min": 0.0, "max": 5.0},
    "precautions": [
      "Regularly check plants for signs of snail activity.",
      "Create barriers like copper tape around plants to deter snails.",
      "Avoid overwatering, as snails thrive in excessively moist conditions.",
      "Encourage natural predators like birds and frogs."
    ],
    "pesticides": [
      {"name": "Metaldehyde", "cost": "200"},
      {"name": "Iron Phosphate", "cost": "150"},
      {"name": "Molluscicide", "cost": "180"}
    ]
  },
  "CEREAL LEAF BEETLE (OULEMA MELANOPUS)": {
    "pest_info":
        "The Cereal Leaf Beetle (Oulema melanopus) primarily targets cereal crops, particularly barley, wheat, and oats. Introduced to North America in the late 1960s, this pest has spread rapidly, causing significant damage to these essential food sources. Adult beetles feed on leaf tissue, resulting in visible damage that can reduce crop yields. Effective management strategies are critical to minimize their impact on agriculture.",
    "ideal_temperature": {"min": 18.0, "max": 27.0},
    "ideal_humidity": {"min": 40.0, "max": 70.0},
    "ideal_wind": {"min": 0.0, "max": 5.0},
    "precautions": [
      "Regularly monitor crop fields for signs of infestation.",
      "Implement crop rotation to disrupt life cycles.",
      "Encourage natural predators such as birds and beneficial insects."
    ],
    "pesticides": [
      {"name": "Pyrethroid Insecticide", "cost": "1000"},
      {"name": "Neonicotinoid Insecticide", "cost": "1500"},
      {"name": "Insect Growth Regulator", "cost": "1200"}
    ]
  },
  "FLY (DIPTERA)": {
    "pest_info":
        "Flies, particularly from the Diptera order, can affect a wide variety of plants including fruits, vegetables, and ornamental plants. Some species are known to transmit diseases while feeding on plants, leading to significant economic losses. Historically, flies have been pests for agriculture for centuries, with various control methods evolving over time as their impact on crop yields became evident.",
    "ideal_temperature": {"min": 20.0, "max": 30.0},
    "ideal_humidity": {"min": 60.0, "max": 80.0},
    "ideal_wind": {"min": 0.0, "max": 5.0},
    "precautions": [
      "Maintain garden cleanliness to reduce breeding grounds.",
      "Use covers or nets to protect plants from flies.",
      "Regularly inspect plants for early signs of infestation."
    ],
    "pesticides": [
      {"name": "Pyrethrin", "cost": "150"},
      {"name": "Neem Oil", "cost": "200"},
      {"name": "Insecticidal Soap", "cost": "100"}
    ]
  },
  "BEAN SEED FLY (DELIA SPP.)": {
    "pest_info":
        "The Bean Seed Fly (Delia spp.) is a significant pest primarily affecting leguminous crops, particularly beans, peas, and some other seedling vegetables. Originating from Europe, it has spread to various regions, causing damage to seedlings by feeding on their roots and underground parts. Its larvae develop in the soil, making early detection challenging. Historically, infestations have been noted as early as the 19th century, leading to substantial crop losses where conditions are favorable for their development.",
    "ideal_temperature": {"min": 15.0, "max": 30.0},
    "ideal_humidity": {"min": 50.0, "max": 80.0},
    "ideal_wind": {"min": 0.0, "max": 10.0},
    "precautions": [
      "Rotate crops to disrupt life cycles.",
      "Use row covers to protect seedlings.",
      "Avoid overwatering to reduce soil moisture.",
      "Implement soil solarization prior to planting."
    ],
    "pesticides": [
      {"name": "Pyrethroid", "cost": "200"},
      {"name": "Neem Oil", "cost": "150"},
      {"name": "Spinosad", "cost": "300"}
    ]
  },
  "CABBAGE STEM FLEA BETTLE": {
    "pest_info":
        "The Cabbage Stem Flea Beetle (Psylliodes chrysocephalus) primarily affects cruciferous crops such as cabbage, broccoli, and Brussels sprouts. This pest has been a known agricultural issue since the 19th century, and its larvae feed on the stems and roots, potentially causing significant yield loss. Infestations can be particularly severe in cooler climates, impacting both organic and conventional farming practices. Control measures vary, but early identification is key to managing its spread effectively.",
    "ideal_temperature": {"min": 15.0, "max": 25.0},
    "ideal_humidity": {"min": 50.0, "max": 80.0},
    "ideal_wind": {"min": 1.0, "max": 5.0},
    "precautions": [
      "Monitor plants regularly for signs of infestation.",
      "Use row covers to protect young plants.",
      "Practice crop rotation to reduce larvae populations.",
      "Remove debris and weeds that harbor pests."
    ],
    "pesticides": [
      {"name": "Pyrethrin", "cost": "500"},
      {"name": "Neem Oil", "cost": "300"},
      {"name": "Bacillus thuringiensis (Bt)", "cost": "400"}
    ]
  },
  "LADYBUG (COCCINELLIDAE)": {
    "pest_info":
        "Ladybugs, also known as ladybird beetles, are beneficial insects commonly found in gardens and agricultural fields. They primarily feed on aphids, mealybugs, and other soft-bodied pests, making them allies for many plants, including roses, tomatoes, and fruit trees. Historically, ladybugs have been utilized in biological pest control for centuries and are celebrated for their bright, colorful appearances. Their presence is often a sign of a healthy garden ecosystem.",
    "ideal_temperature": {"min": 20.0, "max": 30.0},
    "ideal_humidity": {"min": 40.0, "max": 60.0},
    "ideal_wind": {"min": 0.0, "max": 5.0},
    "precautions": [
      "Maintain a diverse garden to support ladybug populations.",
      "Avoid using broad-spectrum pesticides that can harm beneficial insects.",
      "Provide shelter, such as ground cover plants or mulch, to encourage ladybug habitats."
    ],
    "pesticides": [
      {"name": "Neem Oil", "cost": "100"},
      {"name": "Insecticidal Soap", "cost": "150"}
    ]
  },
  "LADYBUG (COCCINELLIDAE) (PUPA)": {
    "pest_info":
        "The Ladybug, specifically in its pupa stage, is known for its beneficial role in controlling aphid populations. These small beetles typically affect plants infested with aphids, mealybugs, and other soft-bodied insects, making them essential in organic gardening. Historically, Ladybugs have been introduced to various regions as a natural pest control method due to their voracious appetite for these pests. They thrive in diverse environments and are widely regarded as a gardener's ally, contributing to the ecosystem's balance by aiding in pest management.",
    "ideal_temperature": {"min": 20.0, "max": 25.0},
    "ideal_humidity": {"min": 40.0, "max": 60.0},
    "ideal_wind": {"min": 0.0, "max": 5.0},
    "precautions": [
      "Avoid using broad-spectrum insecticides which can harm beneficial insects.",
      "Monitor the garden regularly for signs of pest infestations.",
      "Encourage natural habitats to support Ladybug populations."
    ],
    "pesticides": [
      {"name": "Neem Oil", "cost": "3000"},
      {"name": "Insecticidal Soap", "cost": "2500"}
    ]
  },
  "LADYBUG (COCCINELLIDAE) (LARVAE)": {
    "pest_info":
        "Ladybug larvae, belonging to the Coccinellidae family, primarily target aphids, spider mites, and other soft-bodied insects, making them beneficial for controlling pests in vegetable gardens and fruit orchards. Historically, ladybugs were recognized in agriculture for their ability to reduce pest populations naturally. With increasing interest in organic farming, their role has become more significant, promoting healthy ecosystems by minimizing the need for chemical pesticides.",
    "ideal_temperature": {"min": 15.0, "max": 30.0},
    "ideal_humidity": {"min": 40.0, "max": 70.0},
    "ideal_wind": {"min": 0.0, "max": 10.0},
    "precautions": [
      "Encourage the presence of ladybugs by planting nectar-producing flowers.",
      "Avoid using broad-spectrum pesticides that may harm beneficial insects.",
      "Maintain proper plant care to reduce the attraction of harmful pests."
    ],
    "pesticides": [
      {"name": "Neem Oil", "cost": "300"},
      {"name": "Insecticidal Soap", "cost": "150"}
    ]
  },
  "SPIDER (ARANEUS SPP.)": {
    "pest_info":
        "The Araneus species, commonly known as garden spiders, are primarily found in gardens and fields where they construct large, wheel-shaped webs. They primarily affect ornamental plants, vegetables, and some fruits by preying on beneficial insects. Historically, these spiders have been a part of natural pest control, as they help manage insect populations. They thrive in a variety of habitats and can be found across different climates, contributing to biodiversity.",
    "ideal_temperature": {"min": 15.0, "max": 30.0},
    "ideal_humidity": {"min": 40.0, "max": 80.0},
    "ideal_wind": {"min": 0.0, "max": 5.0},
    "precautions": [
      "Maintain a clean garden area to minimize spider habitat.",
      "Use physical barriers like nets to protect plants.",
      "Encourage beneficial insects that prey on pest species."
    ],
    "pesticides": [
      {"name": "Pyrethrin", "cost": "150"},
      {"name": "Neem Oil", "cost": "200"},
      {"name": "Insecticidal Soap", "cost": "100"}
    ]
  },
  "CHIRONOMID MIDGE": {
    "pest_info":
        "Chironomid midges, commonly found in aquatic environments, primarily affect wetland plants, including reeds, sedges, and various emergent vegetation. Their larvae feed on plant roots and can lead to significant damage, impacting the health of aquatic ecosystems. Historically, chironomids have been studied for their role in nutrient cycling in wet habitats, and while they are critical for the ecological balance, their population explosions can occur in nutrient-rich waters, especially in urban areas. Understanding their life cycle is essential for managing their impact on plant health and biodiversity.",
    "ideal_temperature": {"min": 15.0, "max": 25.0},
    "ideal_humidity": {"min": 60.0, "max": 90.0},
    "ideal_wind": {"min": 0.0, "max": 10.0},
    "precautions": [
      "Avoid over-fertilizing wetland areas.",
      "Maintain healthy aquatic ecosystems.",
      "Implement regular monitoring of pest populations."
    ],
    "pesticides": [
      {"name": "Bti (Bacillus thuringiensis israelensis)", "cost": "150"},
      {"name": "Methoprene", "cost": "200"}
    ]
  },
  "BEETLE (COLEOPTERA)": {
    "pest_info":
        "Beetles, belonging to the order Coleoptera, are among the most diverse and widespread insects. They can affect a wide range of plants including crops like corn, soybeans, and potatoes, as well as ornamental plants. Some species, such as the Colorado potato beetle, are known for their significant agricultural damage and resistance to various pesticides. Their life cycle often includes both larval and adult stages that can cause extensive harm. Understanding their biology and behavior is essential for effective management in agricultural practices.",
    "ideal_temperature": {"min": 15.0, "max": 30.0},
    "ideal_humidity": {"min": 40.0, "max": 80.0},
    "ideal_wind": {"min": 0.0, "max": 10.0},
    "precautions": [
      "Monitor crops regularly for signs of beetle damage.",
      "Use crop rotation practices to reduce beetle populations.",
      "Implement cultural controls like removing debris where beetles can breed.",
      "Encourage natural predators to maintain beetle populations."
    ],
    "pesticides": [
      {"name": "Pyrethrin", "cost": "150"},
      {"name": "Imidacloprid", "cost": "200"},
      {"name": "Neem Oil", "cost": "100"}
    ]
  },
  "MOSQUITO": {
    "pest_info":
        "Mosquitoes are small, flying insects known for their biting habits and role in transmitting diseases. They primarily affect humans and animals and are drawn to stagnant water bodies where they breed. Mosquitoes feed on the nectar of various plants, but they are also notorious for using hosts for blood meals, impacting their surroundings. Historically, they have been a nuisance to humans and livestock, being vectors of diseases like malaria, dengue, and Zika virus. Their presence significantly affects outdoor activities and garden plants, especially those with high moisture content.",
    "ideal_temperature": {"min": 20.0, "max": 30.0},
    "ideal_humidity": {"min": 60.0, "max": 90.0},
    "ideal_wind": {"min": 0.0, "max": 5.0},
    "precautions": [
      "Use insect repellent on exposed skin.",
      "Wear long-sleeved clothing to reduce skin exposure.",
      "Eliminate standing water to reduce breeding habitats.",
      "Use screens on windows and doors.",
      "Install mosquito traps or repellents around living areas."
    ],
    "pesticides": [
      {"name": "Permethrin", "cost": "500"},
      {"name": "DEET", "cost": "300"},
      {"name": "Pyrethrin", "cost": "700"}
    ]
  },
  "WASP": {
    "pest_info":
        "Wasps are social insects known for their painful sting and are often found in gardens and woodlands. They can affect various plants, especially those with ripe fruits and flowers, as they are attracted to sweet substances. Wasps play a crucial role in the ecosystem, helping to pollinate plants and control pest populations. However, during late summer and autumn, they may become aggressive and pose a nuisance to humans. Their history dates back millions of years, and they have evolved to adapt to various habitats worldwide.",
    "ideal_temperature": {"min": 20.0, "max": 30.0},
    "ideal_humidity": {"min": 50.0, "max": 80.0},
    "ideal_wind": {"min": 0.0, "max": 15.0},
    "precautions": [
      "Avoid wearing bright colors and floral patterns.",
      "Do not disturb wasp nests.",
      "Remove food and drinks from outdoor areas.",
      "Seal garbage bins tightly."
    ],
    "pesticides": [
      {"name": "Wasp-Exterminate", "cost": "150"},
      {"name": "Wasp-B-Gone", "cost": "200"}
    ]
  },
  "SLUG": {
    "pest_info":
        "Slugs are soft-bodied mollusks that primarily feed on a wide variety of plants, including leafy greens, seedlings, and ornamental plants, causing significant damage. Found across the world, they thrive in moist environments and are notorious for their feeding habits, especially during wet weather. They have been a challenge for gardeners and farmers for centuries, often leading to economic losses in agriculture due to their voracious appetite.",
    "ideal_temperature": {"min": 5.0, "max": 20.0},
    "ideal_humidity": {"min": 70.0, "max": 95.0},
    "ideal_wind": {"min": 0.0, "max": 5.0},
    "precautions": [
      "Maintain dry garden beds.",
      "Use barriers like copper tape.",
      "Collect slugs manually at night.",
      "Encourage natural predators like birds."
    ],
    "pesticides": [
      {"name": "Iron Phosphate", "cost": "200"},
      {"name": "Metaldehyde", "cost": "300"}
    ]
  },
  "CABBAGE WHITEFLY": {
    "pest_info":
        "Cabbage whitefly (Aleyrodes proletella) is a sap-sucking insect that primarily affects plants in the crucifer family, including cabbage, broccoli, cauliflower, and kale. This pest is notorious for weakening plants by extracting their sap, which can lead to reduced yields and poor plant health. Cabbage whiteflies are native to Europe but have spread to other regions, including North America and Asia, often thriving in warm, humid climates. Infestations can lead to sooty mold growth, which can further hamper plant photosynthesis.",
    "ideal_temperature": {"min": 20.0, "max": 30.0},
    "ideal_humidity": {"min": 60.0, "max": 80.0},
    "ideal_wind": {"min": 0.0, "max": 5.0},
    "precautions": [
      "Monitor plants regularly for early signs of infestation.",
      "Use reflective mulch to deter adult whiteflies.",
      "Encourage natural predators, such as ladybugs and lacewings."
    ],
    "pesticides": [
      {"name": "Insecticidal Soap", "cost": "2000"},
      {"name": "Neem Oil", "cost": "3000"},
      {"name": "Pyrethrin", "cost": "2500"}
    ]
  },
  "BEE": {
    "pest_info":
        "Bees are important pollinators that affect a wide range of flowering plants, including fruits such as apples and blueberries, as well as many vegetables and ornamental plants. Historically, their populations have faced declines due to habitat loss, pesticide use, and diseases, prompting global conservation efforts. Understanding their role in ecosystems highlights their significance in agriculture and biodiversity.",
    "ideal_temperature": {"min": 15.0, "max": 30.0},
    "ideal_humidity": {"min": 30.0, "max": 80.0},
    "ideal_wind": {"min": 0.0, "max": 10.0},
    "precautions": [
      "Avoid using pesticides during flowering season.",
      "Plant native flora to support local bee populations.",
      "Provide water sources for bees in gardens."
    ],
    "pesticides": [
      {"name": "Neem Oil", "cost": "200"},
      {"name": "Insecticidal Soap", "cost": "150"}
    ]
  },
  "FUNGUS GNAT (MYCETOPHILIDAE)": {
    "pest_info":
        "Fungus gnats (Mycetophilidae) are small flying insects that primarily affect indoor plants and seedlings, especially those in moist, poorly drained soils. These pests are attracted to decaying organic matter and damp environments, making them common in houseplants, greenhouse crops, and nursery settings. The larvae feed on plant roots and fungi, causing stress to the plants and potentially leading to significant damage if infestations are not managed. First noted in the 18th century, their prevalence has increased with the popularity of containerized growing systems.",
    "ideal_temperature": {"min": 18.0, "max": 24.0},
    "ideal_humidity": {"min": 60.0, "max": 80.0},
    "ideal_wind": {"min": 0.0, "max": 5.0},
    "precautions": [
      "Avoid overwatering plants.",
      "Maintain good drainage in plant pots.",
      "Use sterilized soil for planting.",
      "Encourage natural predators like beneficial nematodes."
    ],
    "pesticides": [
      {"name": "Neem Oil", "cost": "300"},
      {"name": "Insecticidal Soap", "cost": "250"},
      {"name": "Bacillus thuringiensis", "cost": "400"}
    ]
  },
  "HEMIPTERA (PLANT BUG)": {
    "pest_info":
        "Hemiptera, commonly known as plant bugs, are small insects that typically affect a wide range of plants, including ornamentals, vegetables, and fruit crops. They feed on plant sap, which can cause stunted growth, yellowing leaves, and even the spread of diseases. Historically, these pests have been a concern for agriculture since the introduction of various crops, as their feeding habits can severely impact yields and quality. Integrated pest management strategies have been developed to control their populations and minimize damage across affected regions.",
    "ideal_temperature": {"min": 15.0, "max": 30.0},
    "ideal_humidity": {"min": 40.0, "max": 70.0},
    "ideal_wind": {"min": 0.0, "max": 10.0},
    "precautions": [
      "Regularly inspect plants for early signs of infestation.",
      "Use insect netting to protect young plants.",
      "Avoid over-fertilization, which can attract pests.",
      "Encourage natural predators like ladybugs."
    ],
    "pesticides": [
      {"name": "Insecticidal Soap", "cost": "300"},
      {"name": "Neem Oil", "cost": "400"},
      {"name": "Pyrethrin", "cost": "500"}
    ]
  },
  "EARTHWORM": {
    "pest_info":
        "Earthworms are beneficial soil organisms that can positively affect plant growth. While they primarily aid in aerating the soil and enhancing nutrient cycling, excessive populations may disturb delicate root systems in seedlings and certain crops like potatoes and carrots. Initially considered a pest in some agricultural contexts, these creatures have a complex history; they were introduced to North America from Europe and have since both improved soil health and unintentionally caused damage to sensitive crops. Farmers often view Earthworms as both allies and adversaries, depending on their specific agricultural practices and cultivated species.",
    "ideal_temperature": {"min": 10.0, "max": 25.0},
    "ideal_humidity": {"min": 60.0, "max": 80.0},
    "ideal_wind": {"min": 0.0, "max": 5.0},
    "precautions": [
      "Monitor soil moisture levels.",
      "Avoid excessive soil disturbance.",
      "Use organic matter to support healthy earthworm populations."
    ],
    "pesticides": [
      {"name": "Earthworm Safe Pesticide A", "cost": "150"},
      {"name": "Organic Soil Inhibitor B", "cost": "200"}
    ]
  },
  "LEAF MINERS": {
    "pest_info":
        "Leaf miners are small larvae that feed between the upper and lower layers of leaves, creating visible mines or tunnels. They primarily affect a variety of plants, including vegetables like spinach and beets, ornamentals, and fruit trees. The damage can lead to reduced photosynthesis and plant vigor. Leaf miners have a long history, with evidence of their presence occurring in various agricultural regions and affecting crops worldwide. Monitoring and integrated pest management strategies are critical for controlling these pests.",
    "ideal_temperature": {"min": 18.0, "max": 26.0},
    "ideal_humidity": {"min": 50.0, "max": 80.0},
    "ideal_wind": {"min": 0.0, "max": 5.0},
    "precautions": [
      "Regularly inspect plants for early signs of infestation.",
      "Remove affected leaves to prevent the spread.",
      "Encourage natural predators such as ladybugs and parasitic wasps.",
      "Use row covers to protect vulnerable crops."
    ],
    "pesticides": [
      {"name": "Neem Oil", "cost": "500"},
      {"name": "Insecticidal Soap", "cost": "300"},
      {"name": "Pyrethrin", "cost": "700"}
    ]
  },
  "BUMBLEBEE": {
    "pest_info":
        "Bumblebees are important pollinators that primarily affect flowering plants such as tomatoes, peppers, and blueberries. Historically, they were prevalent in North America and Europe, playing a crucial role in agricultural ecosystems. Their decline due to habitat loss, pesticides, and climate change has raised concerns among farmers and conservationists due to their indispensable function in pollination.",
    "ideal_temperature": {"min": 18.0, "max": 30.0},
    "ideal_humidity": {"min": 40.0, "max": 85.0},
    "ideal_wind": {"min": 0.0, "max": 15.0},
    "precautions": [
      "Plant native flowers to attract bumblebees.",
      "Avoid pesticide use during blooming seasons.",
      "Provide natural habitats such as hedgerows.",
      "Maintain clean garden areas without chemical residues."
    ],
    "pesticides": [
      {"name": "Controlling Acaricide", "cost": "200000"},
      {"name": "Organic Insecticide", "cost": "150000"}
    ]
  },
  "GROUND BEETLE (HARPALUS SPP)": {
    "pest_info":
        "Ground beetles (Harpalus spp.) are predatory insects that primarily feed on various agricultural pests, including cutworms and other soil-dwelling larvae. While they can provide beneficial pest control, certain species may harm seedlings and root crops such as potatoes and carrots when populations are high. Ground beetles are found in many habitats across North America and Europe, thriving in fields, gardens, and forests. Historically, they have been recognized for their role in the ecosystem as natural pest regulators, making them both valuable allies and potential nuisances for farmers and gardeners.",
    "ideal_temperature": {"min": 15.0, "max": 30.0},
    "ideal_humidity": {"min": 40.0, "max": 70.0},
    "ideal_wind": {"min": 0.0, "max": 10.0},
    "precautions": [
      "Monitor field conditions regularly.",
      "Implement crop rotation to disrupt beetle life cycles.",
      "Avoid excessive use of broad-spectrum insecticides.",
      "Encourage natural predators in the ecosystem."
    ],
    "pesticides": [
      {"name": "Pyrethrin", "cost": "1500"},
      {"name": "Neem Oil", "cost": "1200"},
      {"name": "Insecticidal Soap", "cost": "800"}
    ]
  },
  "ANT": {
    "pest_info":
        "Ants are social insects that can form large colonies and have a wide variety of diets, including plant material and honeydew from aphids. They are known to affect many plants by protecting sap-sucking pests, such as aphids, which can lead to plant damage. Historically, ants have been present for millions of years, showing remarkable adaptability and interaction with other species, which can sometimes facilitate plant pollination. Their colonies can be found in diverse habitats, from gardens to forests, making them a common concern for gardeners and farmers alike.",
    "ideal_temperature": {"min": 20.0, "max": 30.0},
    "ideal_humidity": {"min": 30.0, "max": 80.0},
    "ideal_wind": {"min": 0.0, "max": 10.0},
    "precautions": [
      "Seal food containers tightly.",
      "Remove standing water around plants.",
      "Maintain clean garden areas.",
      "Use barriers to prevent access to plants."
    ],
    "pesticides": [
      {"name": "Dehydration Granules", "cost": "500"},
      {"name": "Boric Acid Solution", "cost": "250"}
    ]
  },
  "PYRRHOCORIDAE": {
    "pest_info":
        "Pyrrhocoridae, commonly known as cotton stainers, are true bugs that primarily affect various plants, particularly cotton, as well as other crops like okra and hibiscus. These pests extract plant fluids, leading to reduced yield and quality due to staining. Historically, several species within this family have been significant agricultural pests, particularly in regions where cotton is cultivated extensively. Effective management practices are essential to minimize their impact on affected crops.",
    "ideal_temperature": {"min": 20.0, "max": 30.0},
    "ideal_humidity": {"min": 40.0, "max": 70.0},
    "ideal_wind": {"min": 5.0, "max": 15.0},
    "precautions": [
      "Monitor crops regularly for signs of infestation.",
      "Remove weeds that can serve as alternative hosts.",
      "Implement crop rotation to disrupt pest life cycles.",
      "Use physical barriers like row covers to protect plants."
    ],
    "pesticides": [
      {"name": "Neem Oil", "cost": "200"},
      {"name": "Pyrethrin", "cost": "150"},
      {"name": "Insecticidal Soap", "cost": "120"}
    ]
  },
  "LONGICORN": {
    "pest_info":
        "The Longicorn beetle, belonging to the Cerambycidae family, infests a variety of hardwood plants, notably oak, birch, and pine. These beetles are notorious for their wood-boring larvae that can cause significant damage to trees and wooden structures. Historically, the Longicorn beetle has posed challenges for forestry and timber industries due to its invasive nature, leading to increased management efforts in affected regions. They thrive in damp, decaying wood, making them a common problem in forests and lumber yards.",
    "ideal_temperature": {"min": 20.0, "max": 30.0},
    "ideal_humidity": {"min": 60.0, "max": 80.0},
    "ideal_wind": {"min": 0.0, "max": 10.0},
    "precautions": [
      "Inspect wooden structures and furniture regularly.",
      "Seal cracks and crevices where pests may enter.",
      "Maintain proper ventilation to reduce humidity.",
      "Remove any dead or decaying wood from the area."
    ],
    "pesticides": [
      {"name": "PestAway", "cost": "500"},
      {"name": "WoodGuard", "cost": "750"}
    ]
  }
};

LLMPestInfo? getPestInfoFromLocalData(String pestName) {
  for (var element in _pestDetectionLocalData.keys) {
    if (element.contains(pestName)) {
      return LLMPestInfo.fromJson(_pestDetectionLocalData[element]);
    }
  }
  return null;
}
