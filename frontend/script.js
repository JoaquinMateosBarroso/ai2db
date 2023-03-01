
var boton = document.getElementById("mic");
boton.onclick = function() {

    window.SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;

        

    const recognition = new SpeechRecognition();
    recognition.interimResults = true;
    recognition.lang = "es-ES";

    let p = document.createElement('p');
    const words = document.querySelector('#text');
    words.appendChild(p);

    recognition.addEventListener('result', e => {
        const transcript = Array.from(e.results)
        .map(result => result[0])
        .map(result => result.transcript)
        .join('')

        p.textContent = transcript;
        if(e.results[0].isFinal) {
            words.innerHTML(p);
        }
    });

    // recognition.addEventListener('end', recognition.start);

    recognition.start();
}