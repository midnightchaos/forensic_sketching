import requests
import json
import base64

def test_generation_mode(mode):
    url = "http://127.0.0.1:5000/api/generate-image"
    payload = {
        "prompt": "A man with a strong jaw and deep set eyes",
        "negative_prompt": "blurry, low quality",
        "mode": mode,
        "count": 1
    }
    
    print(f"🧪 Testing mode: {mode}...")
    try:
        response = requests.post(url, json=payload, timeout=300) # Long timeout for SD/FLUX loading
        if response.status_code == 200:
            data = response.json()
            if data.get("success"):
                print(f"✅ Success: Received image for {mode}")
                # Optional: save image for manual check
                img_data = base64.b64decode(data["images"][0])
                with open(f"test_output_{mode}.png", "wb") as f:
                    f.write(img_data)
                print(f"📁 Image saved to test_output_{mode}.png")
            else:
                print(f"❌ Error in response: {data.get('error')}")
        else:
            print(f"❌ HTTP Error {response.status_code}: {response.text}")
    except Exception as e:
        print(f"❌ Request failed: {e}")

if __name__ == "__main__":
    print("🚀 Starting Backend Mode Tests")
    print("⚠️ Make sure the server (server/main.py) is running on port 5000")
    
    modes = ["pencil_sketch", "realistic_photo", "gan_hq"]
    for mode in modes:
        test_generation_mode(mode)
