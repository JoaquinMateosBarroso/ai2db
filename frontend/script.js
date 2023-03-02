
var boton = document.getElementById("mic");
boton.onclick = function(e) {
    e.preventDefault()
    const words = document.querySelector('#text');


    window.SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;

        

    const recognition = new SpeechRecognition();
    recognition.interimResults = true;
    recognition.lang = "es-ES";

    let p = document.createElement('p');
    words.appendChild(p);

    recognition.addEventListener('result', e => {
        const transcript = Array.from(e.results)
        .map(result => result[0])
        .map(result => result.transcript)
        .join('')

        if(e.results[0].isFinal) {
            words.value += transcript;
        }
    });

    // recognition.addEventListener('end', recognition.start);

    recognition.start();
}