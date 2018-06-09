squiggly = Theme.find_or_create_by(
    name: "Squiggly", 
    font: "'Monoton', cursive", 
    text_color: "red", 
    text_shadow_color: "rgba(150, 150, 150, 1)", 
    background_color: "#000", 
    background_image: "url('../images/squiggles.gif')", 
)

superstar = Theme.find_or_create_by(
    name: "Superstar", 
    font: "'Pacifico', cursive", 
    text_color: "#fff", 
    text_shadow_color: "rgba(255, 94, 0, 1)", 
    background_color: "pink", 
    background_image: "url('../images/stars.gif')", 
)

stuff = Theme.find_or_create_by(
    name: "Stuff", 
    font: "'Creepster', cursive", 
    text_color: "#03f", 
    text_shadow_color: "rgba(150, 150, 150, 1)", 
    background_color: "#000", 
    background_image: "url('../images/items.gif')", 
)
