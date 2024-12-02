window.onload = function() {
    // Swagger UI initialization
    const ui = SwaggerUIBundle({
      url: "/api-docs",
      dom_id: '#swagger-ui',
      presets: [
        SwaggerUIBundle.presets.apis,
        SwaggerUIStandalonePreset
      ],
      layout: "StandaloneLayout"
    });
    window.ui = ui;
  };
  