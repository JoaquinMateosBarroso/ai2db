function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

var boton = document.getElementById("mic");
boton.onclick = function() {

    window.SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;

        

    const recognition = new SpeechRecognition();
    recognition.interimResults = true;
    recognition.lang = "es-ES";

    let p = document.querySelector('#text');
    

    recognition.addEventListener('result', e => {
        const transcript = Array.from(e.results)
        .map(result => result[0])
        .map(result => result.transcript)
        .join('')

        p.value = transcript;
        if(e.results[0].isFinal) {
            (document.getElementById("get")).submit();
            return
        }
    });

    // recognition.addEventListener('end', recognition.start);
    recognition.start();


}