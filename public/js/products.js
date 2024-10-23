document.addEventListener("DOMContentLoaded", function () {
  // Get all carousel containers
  const carousels = document.querySelectorAll(".carousel-container");

  carousels.forEach(function (carousel, index) {
    // Check if it's the index page
    const isIndexPage = carousel.getAttribute("data-index-page") === "true";

    // Initialize Tiny Slider for each carousel
    const slider = tns({
      container: carousel.querySelector(".properties"), // Target the correct featured properties
      slideBy: "page",
      edgePadding: 0, // Ensure there's no padding on the edges
      gutter: 0,
      autoplay: false,
      controls: false, // We use custom controls
      nav: false, // Disable default navigation
      responsive: {
        640: {
          items: 2,
        },
        900: {
          items: isIndexPage ? 3 : 4,
        },
        1200: {
          items: isIndexPage ? 3 : 4, // Adjust item count based on page
        },
      },
    });

    // Add event listeners for the custom prev/next buttons
    const prevButton = carousel.querySelector(".featured-prev");
    const nextButton = carousel.querySelector(".featured-next");

    prevButton.addEventListener("click", function (e) {
      e.preventDefault();
      slider.goTo("prev"); // Go to the previous slide
    });

    nextButton.addEventListener("click", function (e) {
      e.preventDefault();
      slider.goTo("next"); // Go to the next slide
    });
  });
});
