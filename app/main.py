"""
15-Factor AI Content Generator
Initial implementation – will be expanded with all factors
"""

from fastapi import FastAPI

app = FastAPI(
    title="AI Content Generator",
    description="15-Factor App implementation with OpenAI integration and Datadog observability",
    version="1.0.0",
    docs_url="/api/docs",
    redoc_url="/api/redoc",
)


@app.get("/")
async def root():
    return {
        "message": "AI Content Generator - 15-Factor App with Datadog",
        "version": "1.0.0",
        "status": "🚧 In development",
        "factors_implemented": "15/15 (in progress)"
    }


@app.get("/health")
async def health():
    return {"status": "healthy", "service": "ai-content-generator"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
