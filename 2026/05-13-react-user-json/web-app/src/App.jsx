import usersData from '../../users.json';

export default function App() {
  return (
    <div>
      <h1>User Dashboard</h1>
      <p>ここにRubyで作ったデータを表示します</p>
      <p>読み込んだユーザー数: {usersData.length}人</p>
    </div>
  );
}
