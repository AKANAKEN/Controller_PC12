document.addEventListener('DOMContentLoaded', function() {
  let slides = [];
  let currentIndex = 0;

  document.getElementById('csvFile').addEventListener('change', function(event) {
    const file = event.target.files[0];
    const reader = new FileReader();

    reader.onload = function(e) {
      const text = e.target.result;
      const rows = text.split('\n');
      rows.forEach((row, index) => {
        const slide = document.createElement('div');
        slide.className = 'slide';
        slide.innerHTML = `<p>${row}</p>`;
        if (index === 0) slide.classList.add('active');
        slides.push(slide);
        document.getElementById('slides-container').appendChild(slide);
      });
    };

    reader.readAsText(file);
  });

  // Navigation
  document.getElementById('prev').addEventListener('click', function() {
    if (currentIndex > 0) {
      slides[currentIndex].classList.remove('active');
      currentIndex--;
      slides[currentIndex].classList.add('active');
    }
  });

  document.getElementById('next').addEventListener('click', function() {
    if (currentIndex < slides.length - 1) {
      slides[currentIndex].classList.remove('active');
      currentIndex++;
      slides[currentIndex].classList.add('active');
    }
  });
});
