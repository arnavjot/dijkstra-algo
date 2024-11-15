import City from './City';
import db from './db';

db.once('open', async () => {
  await City.deleteMany();

  const cities = [
    {
      name: 'Chandigarh',
      neighbors: [
        { name: 'Delhi', distance: 243 },
        { name: 'Jaipur', distance: 530 },
        { name: 'Lucknow', distance: 680 },
      ],
    },
    {
      name: 'Delhi',
      neighbors: [
        { name: 'Chandigarh', distance: 243 },
        { name: 'Jaipur', distance: 280 },
        { name: 'Lucknow', distance: 555 },
        { name: 'Mumbai', distance: 1420 },
      ],
    },
    {
      name: 'Mumbai',
      neighbors: [
        { name: 'Delhi', distance: 1420 },
        { name: 'Ahmedabad', distance: 530 },
        { name: 'Pune', distance: 150 },
        { name: 'Bangalore', distance: 984 },
      ],
    },
    {
      name: 'Bangalore',
      neighbors: [
        { name: 'Mumbai', distance: 984 },
        { name: 'Hyderabad', distance: 570 },
        { name: 'Chennai', distance: 345 },
        { name: 'Ahmedabad', distance: 1490 },
      ],
    },
    {
      name: 'Jaipur',
      neighbors: [
        { name: 'Delhi', distance: 280 },
        { name: 'Chandigarh', distance: 530 },
        { name: 'Ahmedabad', distance: 660 },
      ],
    },
    {
      name: 'Ahmedabad',
      neighbors: [
        { name: 'Jaipur', distance: 660 },
        { name: 'Surat', distance: 265 },
        { name: 'Mumbai', distance: 530 },
        { name: 'Bangalore', distance: 1490 },
      ],
    },
    {
      name: 'Hyderabad',
      neighbors: [
        { name: 'Bangalore', distance: 570 },
        { name: 'Varanasi', distance: 1189 },
        { name: 'Pune', distance: 560 },
      ],
    },
    {
      name: 'Chennai',
      neighbors: [
        { name: 'Bangalore', distance: 345 },
        { name: 'Varanasi', distance: 1886 },
        { name: 'Kolkata', distance: 1670 },
      ],
    },
    {
      name: 'Pune',
      neighbors: [
        { name: 'Mumbai', distance: 150 },
        { name: 'Hyderabad', distance: 560 },
        { name: 'Surat', distance: 412 },
      ],
    },
    {
      name: 'Varanasi',
      neighbors: [
        { name: 'Chennai', distance: 1886 },
        { name: 'Hyderabad', distance: 1189 },
        { name: 'Lucknow', distance: 320 },
      ],
    },
    {
      name: 'Lucknow',
      neighbors: [
        { name: 'Delhi', distance: 555 },
        { name: 'Chandigarh', distance: 680 },
        { name: 'Varanasi', distance: 320 },
      ],
    },
    {
      name: 'Surat',
      neighbors: [
        { name: 'Ahmedabad', distance: 265 },
        { name: 'Pune', distance: 412 },
      ],
    },
  ];

  await City.insertMany(cities);

  console.log('data inserted.');
  process.exit();
});
