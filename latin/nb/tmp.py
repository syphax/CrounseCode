from cltk import NLP

nlp = NLP(language="lat")

# Your Latin text
latin_text = "Arma virumque cano, Troiae qui primus ab oris"

# Process the text
doc = nlp.analyze(text=latin_text)

# Get lemmas
lemmas = [word.lemma for word in doc.words]

# Print original words and their lemmas
for word, lemma in zip([word.string for word in doc.words], lemmas):
    print(f"Word: {word:<20} Lemma: {lemma}")