// src/wchl-hackathon-frontend/src/dfinity/chainpatrol.js
import { wchl_hackathon_backend } from '../../../declarations/wchl-hackathon-backend'

export default {
  async analyzeWallet(id) {
    return await wchl_hackathon_backend.analyzeWallet(id);
  },
  async getAnalytics() {
    return await wchl_hackathon_backend.getAnalytics();
  },
  async addWallet(id, principalText) {
    const principal = await import('@dfinity/principal').then(mod =>
      mod.Principal.fromText(principalText)
    );
    return await wchl_hackathon_backend.addWallet(id, principal);
  },
  async getWallets() {
    return await wchl_hackathon_backend.getWallets();
  },
  async initWallets() {
    return await wchl_hackathon_backend.initWallets();
  }
}
