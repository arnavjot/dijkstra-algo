"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = __importDefault(require("mongoose"));
const encodedPassword = encodeURIComponent('youtube12/');
mongoose_1.default.connect(`mongodb+srv://arnavjotkaur27:${encodedPassword}@cluster0.0tktb.mongodb.net/`, {});
exports.default = mongoose_1.default.connection;
//# sourceMappingURL=db.js.map