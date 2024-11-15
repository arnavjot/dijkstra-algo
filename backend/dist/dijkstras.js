"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.default = dijkstrafun;
function dijkstrafun(graph, start, end) {
    const distances = {};
    const previous = {};
    const queue = [];
    for (const vertex in graph) {
        distances[vertex] = vertex === start ? 0 : Infinity;
        previous[vertex] = null;
        queue.push(vertex);
    }
    while (queue.length > 0) {
        queue.sort((a, b) => distances[a] - distances[b]);
        const shortestVertex = queue.shift();
        if (shortestVertex === end) {
            const path = [];
            let current = end;
            while (current) {
                path.unshift(current);
                current = previous[current];
            }
            return path;
        }
        for (const neighbor in graph[shortestVertex]) {
            const distance = graph[shortestVertex][neighbor];
            const newDistance = distances[shortestVertex] + distance;
            if (newDistance < distances[neighbor]) {
                distances[neighbor] = newDistance;
                previous[neighbor] = shortestVertex;
            }
        }
    }
    return [];
}
//# sourceMappingURL=dijkstras.js.map