interface Neighbors {
  [name: string]: number;
}

export default function dijkstrafun(graph: Record<string, Neighbors>, start: string, end: string): string[] {
  const distances: Record<string, number> = {};
  const previous: Record<string, string | null> = {};
  const queue: string[] = [];

  // Initialize distances and previous nodes for each vertex
  for (const vertex in graph) {
    distances[vertex] = vertex === start ? 0 : Infinity;
    previous[vertex] = null;
    queue.push(vertex);
  }

  while (queue.length > 0) {
    // Sort queue to get the vertex with the smallest distance at the front
    queue.sort((a, b) => distances[a] - distances[b]);
    const shortestVertex = queue.shift()!;  // Remove the vertex with the smallest distance

    // If the end vertex is reached, we can stop and reconstruct the path
    if (shortestVertex === end) {
      const path: string[] = [];
      let current: string | null = end;

      // Backtrack from the end node to the start node using the `previous` map
      while (current) {
        path.unshift(current);
        current = previous[current];
      }

      return path;  // Return the path from start to end
    }

    // Update distances for each neighbor of the current vertex
    for (const neighbor in graph[shortestVertex]) {
      const distance = graph[shortestVertex][neighbor];
      const newDistance = distances[shortestVertex] + distance;

      // If a shorter path to the neighbor is found, update the distance and previous node
      if (newDistance < distances[neighbor]) {
        distances[neighbor] = newDistance;
        previous[neighbor] = shortestVertex;
      }
    }
  }

  // If no path is found, return an empty array
  return [];
}
